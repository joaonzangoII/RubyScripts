require 'rubygems'
require 'mechanize'
require 'awesome_print'
a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

a.get('http://google.com/') do |page|
  search_result = page.form_with(:name => 'gbqf') do |search|
    search.q = 'ruby mechanize'
    ap search
  end.submit

  search_result.links.each do |link|
      ap link.text
  end
end
