module Generators::Bots
  def self.call
    Bot.create!(
      [
        { level: 1, name: 'Armillaria',  attack: 15,  defense: 80,  hp: 100, avatar: File.new("#{Rails.root}/db/seeds/bots/armillaria.jpg") },
        { level: 2, name: 'Chanterelle', attack: 40,  defense: 85,  hp: 150, avatar: File.new("#{Rails.root}/db/seeds/bots/chanterelle.jpg") },
        { level: 3, name: 'Amanita',     attack: 60,  defense: 120, hp: 200, avatar: File.new("#{Rails.root}/db/seeds/bots/amanita.jpg") },
        { level: 4, name: 'Rat',         attack: 90,  defense: 180, hp: 250, avatar: File.new("#{Rails.root}/db/seeds/bots/rat.jpg") },
        { level: 5, name: 'Spider',      attack: 110, defense: 300, hp: 400, avatar: File.new("#{Rails.root}/db/seeds/bots/spider.jpg") },
        { level: 6, name: 'Hoblin',      attack: 160, defense: 300, hp: 600, avatar: File.new("#{Rails.root}/db/seeds/bots/hoblin.jpg") },
        { level: 7, name: 'Ork',         attack: 200, defense: 350, hp: 800, avatar: File.new("#{Rails.root}/db/seeds/bots/ork.jpg") },
        { level: 8, name: 'Drowned',     attack: 220, defense: 80, hp: 1000, avatar: File.new("#{Rails.root}/db/seeds/bots/drowned.jpg") }
      ]
    )
  end
end
