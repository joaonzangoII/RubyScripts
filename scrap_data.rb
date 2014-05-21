require "mechanize"
require "nokogiri"
require "awesome_print"


url = ARGV[0]
fp = File.new("wikilinks.txt", "w")

agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }

html = agent.get(url).body
html_doc = Nokogiri::HTML(html)

list = html_doc.xpath("//ul[@class='list_horiz']")
h={}
list.each { |i|
name = i.xpath('//a').text
url = i.xpath('//a/@href').text
#   title = i.xpath("//a[@href]")
#   title.map do |x|
#   [
#       x.text,x['href']
#   ]
#   ap x
# end
ap name.gsub("\n\t\t\t\t\t\t","             ")
  # h[title.text.strip] = title['href']
  # puts h[title.text.strip]  # fp.write(i.text + "\n")
  # s = title.gsub("/t/t/t/t/t","")
  # s = s.gsub("</section>","")
  # s = s.gsub("<br/><br/>","\n")

  # puts title.strip
}
# ap h
