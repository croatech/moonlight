module Generators::Tools::Categories
  def self.call
    Tool::Category.create!(
      [
        { name: 'Lumberjacking', type: 'lumberjacking' },
        { name: 'Fishing',       type: 'fishing' }
      ]
    )
  end
end
