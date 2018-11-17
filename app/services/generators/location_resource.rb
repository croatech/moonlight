module Generators::LocationResource
  def self.call
    Location.where(name: 'Sacred Forest').each do |location|
      ::LocationResource.create!(
        [
          { location_id: location.id, resource_id: Resource.find_by(name: 'Beech').id },
          { location_id: location.id, resource_id: Resource.find_by(name: 'Elm').id }
        ]
      )
    end

    Location.where(name: 'Northern Forest').each do |location|
      ::LocationResource.create!(location_id: location.id, resource_id: Resource.find_by(name: 'Birch').id)
    end

    LocationResource.create!(location_id: Location.find_by(name: 'Dalf Lagoon').id,     resource_id: Resource.find_by(name: 'Larch').id)
    LocationResource.create!(location_id: Location.find_by(name: 'Mycelium').id,        resource_id: Resource.find_by(name: 'Sequoia').id)
    LocationResource.create!(location_id: Location.find_by(name: 'Mystic Thicket').id,  resource_id: Resource.find_by(name: 'Eucalyptus').id)
    LocationResource.create!(location_id: Location.find_by(name: 'River Fork').id,      resource_id: Resource.find_by(name: 'Rowan').id)
    LocationResource.create!(location_id: Location.find_by(name: 'Hanging Willage').id, resource_id: Resource.find_by(name: 'Mysterious wood').id)
  end
end
