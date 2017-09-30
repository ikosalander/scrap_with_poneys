require 'open-uri'
require 'nokogiri'

page = Nokogiri::HTML(open("https://developer.mozilla.org/"))   




page.traverse do | node |
  regexp = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  if node.match(regexp)
    puts "it match"
  end
end
