#wordpress, joomla, wixx, drupal, solocal, jimdoo, emonsite, siteavocats.fr
#

require "google_drive"
require 'google/apis/drive_v2'
require 'nokogiri'
require 'open-uri'
require 'nikkou'


session = GoogleDrive::Session.from_config("config.json")

ws = session.spreadsheet_by_key("149w_hmvhVAnm5r0c8U4Npcdkodo6ahyhpOEZyIGFHWU").worksheets[0]


ws[10, 6] = "carapuce"
ws.save



(2..ws.num_rows).each do | row |
#url = ws[row, 2]
# url = "http://" + url
  begin
url = ws[row, 1]

# url = "http://" + url

doc = Nokogiri::HTML(open(url)).to_s

miaous = doc.scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-feZ]{2,4}/i)
ws[row, 6] = miaous
carapuce = doc.scan(/33+[0-9]{8}+/)
ws[row, 7] = carapuce
tortank = doc.scan(/[0-9]{10}/)
ws[row, 7] = tortank

#salameche = doc.scan(/33+[0-9]{1}+[0-9]{2}+.+[0-9]{2}+.+[0-9]{2}+.+[0-9]{2}/)
#ronflex = doc.scan(/0+[0-9]{1}+[0-9]{2}+.+[0-9]{2}+.+[0-9]{2}+.+[0-9]{2}/)

ws.save

# print url
# print "  :  "
# # print miaous
 #print carapuce
# print tortank
#print salameche


rescue
  puts "#{url} blablabla"
end


sleep(1)
end
# ws.save
