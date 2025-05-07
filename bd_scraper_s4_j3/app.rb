require_relative "lib/app/scrapper"
require_relative "lib/app/save_json"
require_relative "lib/app/save_csv"
require_relative "lib/app/save_spreadsheet"

emails = Scrapper.scrape_emails

puts "Choisissez un format de sauvegarde :"
puts "1. JSON"
puts "2. CSV"
puts "3. Google Spreadsheet"

choice = gets.chomp.to_i

case choice
when 1
  SaveJSON.save(emails)
when 2
  SaveCSV.save(emails)
when 3
  SaveSpreadsheet.save(emails)
else
  puts "Choix invalide."
end
