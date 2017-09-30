require 'net/http'


def extract_emails_to_array(txt)

  reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

  txt.scan(reg).uniq

end

#input = IO.readlines("in.txt")

input = Net::HTTP.get('localhost', '/index.html').to_s # => String


output = File.new("mails.txt",  "w+")

#result_array = extract_emails_to_array(input.join(" ")).sort
result_array = extract_emails_to_array(input).sort

puts result_array #optional

result_array.each{|s| output << s.to_s+"\n" }
# self.explain
