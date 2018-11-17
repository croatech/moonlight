module Generators::Base
  def self.call
    Generators::Locations.call
    Generators::LocationLocations.call
    Generators::Avatars.call
    Generators::Players.call
    Generators::Equipment::Categories.call
    Generators::Equipment::Items.call
    Generators::Tools::Categories.call
    Generators::Tools::Items.call
    Generators::Resources.call
    Generators::LocationResource.call
    Generators::Bots.call
    Generators::LocationBots.call
  end
end
