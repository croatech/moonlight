class Player < ActiveRecord::Base
  
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  belongs_to :location
  belongs_to :user

  has_many :fights

  STATS = ['attack', 'defense', 'hp']
  SLOTS = ['head', 'chest', 'shoulders', 'hands', 'legs', 'weapon', 'shield']

  # generating of methods for an increasing of stats
  STATS.each do |stat|
    stat_name = stat.to_sym
    method_name = "increase_#{stat}".to_sym

    define_method(method_name) do
      # increase for 5 if hp stat
      self.increment!(stat_name, 4) if stat_name == :hp
      self.increment!(stat_name, 1)
    end
  end
end
