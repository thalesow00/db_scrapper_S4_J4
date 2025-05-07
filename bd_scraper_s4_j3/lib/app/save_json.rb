require "json"

class SaveJSON
  def self.save(data)
    File.open("db/emails.json", "w") do |file|
      file.write(JSON.pretty_generate(data))
    end
    puts "Données sauvegardées en JSON."
  end
end
