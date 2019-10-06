module Generators::Base
  class << self
    def call
      generators.each_with_index do |generator, index|
        puts "Importing resources: #{index + 1}/#{generators.length}"
        generator.call
      end
    end

    def generators
      [
        Generators::Locations,
        Generators::LocationLocations,
        Generators::Avatars,
        Generators::Players,
        Generators::Equipment::Categories,
        Generators::Equipment::Items,
        Generators::Tools::Categories,
        Generators::Tools::Items,
        Generators::Resources,
        Generators::LocationResource,
        Generators::Bots,
        Generators::LocationBots
      ]
    end
  end
end
