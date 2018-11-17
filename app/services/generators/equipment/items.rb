module Generators::Equipment::Items
  def self.call
    Generators::Equipment::Items::Normal.call
    Generators::Equipment::Items::Artifacts.call
  end
end
