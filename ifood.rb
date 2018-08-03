require 'open-uri'
require 'nokogiri'

page = open "https://www.ifood.com.br/delivery/sao-paulo-sp/big-x-picanha---center-norte-vila-guilherme"
html = Nokogiri::HTML page

i = 1

html.search(".result-actions").each do |cite|
  puts cite
end
  