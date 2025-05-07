require "csv"

class SaveCSV
  def self.save(data)
    CSV.open("db/emails.csv", "w") do |csv|
      csv << ["Ville", "Email"]
      data.each { |city, email| csv << [city, email] }
    end
    puts "Données sauvegardées en CSV."
  end
end
