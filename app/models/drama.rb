require 'nokogiri'
require 'open-uri'

class Drama < ActiveRecord::Base
	validates :url, presence: :true, uniqueness: :true

	before_save :fetch_drama_info

	scope :titles, -> {
  		select(:title).map(&:title)
	}

	def fetch_drama_info
		doc = Nokogiri::HTML(open(url))

		title = doc.at_css('h1').text
		last_ep_title = doc.css('h2 a').first.text
		subbed_img_url = doc.css('li:nth-child(1) .raw').attr('src').to_s
		subbed = subbed_img_url.include? "sub"
		broadcast_date = doc.css('.list-episode span').first.text
		poster = doc.css('.poster').attr('src').to_s
		drama_description = doc.css('.info p').text

		self.title = title
		self.img = poster
		self.description = drama_description
		self.subbed = subbed
		self.broadcasted_at = Date.strptime(broadcast_date, "%A, %m/%d/%Y")
		self.last_ep = last_ep_title
	end
end
