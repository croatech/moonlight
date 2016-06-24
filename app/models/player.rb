class Player < ActiveRecord::Base
  
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  belongs_to :location
  belongs_to :user

  has_many :fights
  has_many :logs

  STATS = %w( attack defense hp )
  SLOTS = %w( helmet armor mail gloves bracers foots belt weapon shield ring necklace )
  CRAFT = %w( lumberjacking fishing )

  # generate methods for an increasing of stats
  STATS.each do |stat|
    stat_name = stat.to_sym
    method_name = "increase_#{stat}".to_sym

    define_method(method_name) do
      # increase for 5 if hp stat
      self.increment!(stat_name, 4) if stat_name == :hp
      self.increment!(stat_name, 1)
    end
  end

  def level_up_gold
    level * 150
  end

  def level_up_exp
    exp_next * 2
  end
end
