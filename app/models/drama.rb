require 'nokogiri'
require 'open-uri'

class Drama < ActiveRecord::Base
	belongs_to :user
	
	validates :url, presence: :true, uniqueness: {:scope=>:user_id}, 
	format: { with: /(http:\/\/myasiantv.se\/drama\/).*|(http:\/\/myasiantv.se\/movie\/).*/,
    message: "This url wouldn't work..." }
	
	before_save :fetch_drama_info


	default_scope -> { order(created_at: :desc) }
	scope :titles, -> {
  		select(:title).map(&:title)
	}

	def fetch_drama_info
			doc = Nokogiri::HTML(open(url))

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
			self.last_refresh = Time.now
		rescue URI::BadURIError
  			false
		rescue URI::InvalidURIError
  			false
	end
end
