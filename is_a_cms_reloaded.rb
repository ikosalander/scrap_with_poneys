#wordpress, joomla, wixx, drupal, solocal, jimdoo, emonsite, siteavocats.fr
#

require "google_drive"
require 'google/apis/drive_v2'
require 'nokogiri'
require 'open-uri'
require 'nikkou'


session = GoogleDrive::Session.from_config("config.json")

ws = session.spreadsheet_by_key("149w_hmvhVAnm5r0c8U4Npcdkodo6ahyhpOEZyIGFHWU").worksheets[0]


ws[10, 4] = "carapuce"
ws.save

(1..ws.num_rows).each do | row |
#url = ws[row, 2]

  begin
url = ws[row, 1]

# url = "http://" + url

doc = Nokogiri::HTML(open(url))
doc = "wordpress"
case
when /wp-content/.match(doc) then ws[row, 4] = "wordpress"
when /Drupal/.match(doc) then ws[row, 4] = "drupal"
when /wix/.match(doc) then ws[row, 4] = "wix"
when /joomla/.match(doc) then ws[row, 4] = "joomla"
when /adobe.flash/.match(doc) then ws[row, 4] = "flash"
when /jimdoo/.match(doc) then ws[row, 4] = "jimdoo"
#when /php/.match(doc) then ws[row, 6] = "php"
  else puts "#{url} is not identified"
end
ws.save
rescue
  puts "blablabla"
end


sleep(1)
end
# ws.save
