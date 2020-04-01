require 'mechanize'

agent = Mechanize.new
page = agent.get('https://ytranking.net/?p=1')
elements = page.search('.channel-list .title')

elements.each do |ele|
  puts ele.inner_text
end

elements = page.search('.channel-list img')

elements.each do |ele|
  puts ele.get_attribute('src')
end