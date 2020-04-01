require 'mechanize'

agent = Mechanize.new
page = agent.get("https://app-mooovi.herokuapp.com/works/initial_scraping")
elements = page.search('p')

elements.each do |ele|
  puts ele.inner_text
end