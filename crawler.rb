require 'open-uri'
require 'nokogiri'

puts "Insira uma palavra chave: "
keyword = gets 

#Insert Keyword to Google
html = open "https://www.google.com.br/search?q=#{keyword}&num=100"

doc = Nokogiri::HTML(html)

i = 1

doc.css('cite').each do |d|
  #Insert you site
  if /www.purchasestore.com.br/ === d.content 
    puts "#{i} - " + d.content 
  end  
  i += 1
end	