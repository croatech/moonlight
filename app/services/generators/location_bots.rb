module Generators::LocationBots
  def self.call
    Location.where(name: 'Sacred Forest').each do |location|
      LocationBot.create!(
        [
          { location_id: location.id, bot_id: Bot.find_by(name: 'Hoblin').id },
          { location_id: location.id, bot_id: Bot.find_by(name: 'Ork').id }
        ]
      )
    end

    LocationBot.create!(
      [
        { location_id: Location.find_by(name: 'Mycelium').id,    bot_id: Bot.find_by(name: 'Armillaria').id },
        { location_id: Location.find_by(name: 'Mycelium').id,    bot_id: Bot.find_by(name: 'Chanterelle').id },
        { location_id: Location.find_by(name: 'Mycelium').id,    bot_id: Bot.find_by(name: 'Amanita').id },
        { location_id: Location.find_by(name: 'Shady Walk').id,  bot_id: Bot.find_by(name: 'Rat').id },
        { location_id: Location.find_by(name: 'Shady Walk').id,  bot_id: Bot.find_by(name: 'Spider').id },
        { location_id: Location.find_by(name: 'Dalf Lagoon').id, bot_id: Bot.find_by(name: 'Drowned').id }
      ]
    )
  end
end
