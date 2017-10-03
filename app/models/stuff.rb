class Stuff < ApplicationRecord
  belongs_to :stuffable, polymorphic: true
  belongs_to :player
end
