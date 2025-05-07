require "google_drive"
require "dotenv"
Dotenv.load

class SaveSpreadsheet
  def self.save(data)
    begin
      session = GoogleDrive::Session.from_config(".env")
      ws = session.spreadsheet_by_title("Emails Mairies").worksheets[0]

      ws[1, 1] = "Ville"
      ws[1, 2] = "Email"
      
      row = 2
      data.each do |city, email|
        ws[row, 1] = city
        ws[row, 2] = email
        row += 1
      end

      ws.save
      puts "Données sauvegardées dans Google Spreadsheet."
    rescue JSON::ParserError => e
      puts "Erreur de format JSON dans `.env` : #{e.message}"
    end
  end
end
