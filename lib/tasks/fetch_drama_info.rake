namespace :fetch_drama_info do
  desc "Updating avaiable info"
  task update_all: :environment do
  	require 'nokogiri'
	require 'open-uri'

	url = "http://myasiantv.se/drama/six-flying-dragons/"

	doc = Nokogiri::HTML(open(url))

	title = doc.at_css('h1').text
	last_ep_title = doc.css('h2 a').first.text
	subbed_img_url = doc.css('li:nth-child(1) .raw').attr('src').to_s
	subbed = subbed_img_url.include? "sub"
	broadcast_date = doc.css('.list-episode span').first.text
	poster = doc.css('.poster').attr('src').to_s

	Drama.create(
      title: title,
      img: poster
      )

	puts "Title: " + title
	puts "Last Ep Title: " + last_ep_title
	puts "Subbed: " + subbed.to_s
	puts "Broadcasted at: " + broadcast_date
	puts "Image: " + poster

  end

end
