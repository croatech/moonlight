module Seeds::LocationLocationsImport
  def self.call
    # Near cells of each cell
    Location.cells.where(inactive: false).find_each do |location|
      near_location_ids = []
      near_location_ids << location.id - 9
      near_location_ids << location.id - 8
      near_location_ids << location.id - 7
      near_location_ids << location.id - 1
      near_location_ids << location.id + 1
      near_location_ids << location.id + 7
      near_location_ids << location.id + 8
      near_location_ids << location.id + 9
      near_location_ids.each do |id|
        near_location = Location.find(id)
        next if near_location.inactive?
        LocationLocation.create!(location: location, near_location: near_location)
      end
    end
    LocationLocation.create!(location: Location.find_by(name: 'Sacred Forest'), near_location: Location.find_by(name: 'Wayward Pines'))
    LocationLocation.create!(location: Location.find_by(name: 'Shady Walk'), near_location: Location.find_by(name: 'Wayward Pines'))
    LocationLocation.create!(near_location: Location.find_by(name: 'Shady Walk'), location: Location.find_by(name: 'Wayward Pines'))
    LocationLocation.create!(near_location: Location.find_by(name: 'Shady Walk'), location: Location.find_by(name: 'Wayward Pines'))
  end
end
