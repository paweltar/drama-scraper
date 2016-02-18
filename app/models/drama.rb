require 'nokogiri'
require 'httparty'

class Drama < ActiveRecord::Base
	validates :url, presence: :true, uniqueness: :true

	before_save :fetch_drama_info

	scope :titles, -> {
  		select(:title).map(&:title)
	}

	def fetch_drama_info
		html_string = HTTParty.get(url)
		doc = Nokogiri::HTML(html_string)

		title = doc.at_css('h1').text
		last_ep_title = doc.css('#content-left li:nth-child(1) a').text
		subbed_img_url = doc.css('li:nth-child(1) .raw').attr('src').to_s
		subbed = subbed_img_url.include? "sub"
		broadcast_date = doc.css('li:nth-child(1) span').text
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
