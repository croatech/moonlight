class Log < ActiveRecord::Base
  
  belongs_to :player

  MAXIMUM_SIZE = 50
end
