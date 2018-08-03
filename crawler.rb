require 'open-uri'
require 'nokogiri'
require 'csv'
require 'date'

# Insert your keywords
keywords = ['short lady rock branco','vestido justo preto','body cavado','vestido justo','kit ranco','blusinha embuste','camiseta me poupe se poupe nos poupe','KIT 3 VESTIDO BASICO DE ALCINHA','PARKA RASGADA JEANS','CALCA COURO FAKE PRETA','PARKA CAMUFLADA FEMININA','CALCA CAMUFLADA FEMININA','BODY FEMININO RENDA','TOP FEMININO COM BOJO','CAMISETA ANTI EMBUSTE','lady rock','short lady rock','parka feminina','PARKA FEMININA COM CAPUZ','CAMISETA ME POUPE','SAIA VINIL PRETA','BODY FEMININO RENDA','BLUSA RANCO','VESTIDO MANGA COMPRIDA JUSTO','BLUSA PLENA','VESTIDO OMBRO A OMBRO PRETO','VESTIDO CINZA JUSTO','VESTIDO JUSTO PRETO CURTO','VESTIDO TUBINHO BORDO']

CSV.open("keyword-#{Time.now}.csv", "wb") do |csv|	
  csv << ["position",'keyword','url']
	keywords.each do |keyword|
	  page = open "http://www.google.com/search?num=100&q=#{keyword}"
	  html = Nokogiri::HTML page

	  i = 1
	  html.search("cite").each do |cite|
	  	# Insert your website
	    if /purchasestore.com.br/ === cite.inner_text
      	puts "#{i} - #{keyword} - #{cite.inner_text}" 
	      csv << [i,keyword,cite.inner_text]
	    end
	    i += 1
	  end
	end  
end  