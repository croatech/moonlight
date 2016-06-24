class LocationResource < ActiveRecord::Base
  belongs_to :location
  belongs_to :resource
end
