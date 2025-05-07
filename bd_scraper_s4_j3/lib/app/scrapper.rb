require "nokogiri"
require "open-uri"

class Scrapper
  #URL = "https://www.valdoise.fr/nouvelle-liste-mairies.htm"  # Mets une URL valide !
  URL = "https://www.valdoise.fr/nouvelle-liste-mairies.html"  # Mets une URL valide !


  def self.scrape_emails
    begin
      page = Nokogiri::HTML(URI.open(URL))
      emails = {}

      page.css(".mairie").each do |mairie|
        city = mairie.css("h2").text.strip
        email = mairie.css(".email").text.strip
        emails[city] = email unless email.empty?
      end
      
      return emails
    rescue OpenURI::HTTPError => e
      puts "Erreur : Impossible de récupérer les données (#{e.message})"
      return {}
    end
  end
end
