require 'nokogiri'
require 'open-uri'

puts "scrap site a refaire"
url = "http://transports-dumont.fr/"
doc = Nokogiri::HTML(open(url))


title = doc.xpath("//title").text
puts "titre : " + title


#head = doc.xpath("//h2").first.text
head = doc.xpath("//div/a").text
doc.xpath("//div/a").each do | zz |
	ary = Array.new
	ary << zz
	moly = ary[1]
	puts moly
end
puts "---------------------------"


puts "rewrite in my template"
markeur = "zkowwwww"

zeub = markeur.gsub(/zkowwwww/, "<title>#{title}</title>")

puts zeub
