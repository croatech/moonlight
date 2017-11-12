class Event < ApplicationRecord
  
  belongs_to :player

  MAXIMUM_SIZE = 50
end
