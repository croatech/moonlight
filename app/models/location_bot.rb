class LocationBot < ActiveRecord::Base

  belongs_to :location
  belongs_to :bot
end