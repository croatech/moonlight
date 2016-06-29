class Player < ActiveRecord::Base
  
  include Percentable  

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :name, presence: true

  belongs_to :location
  belongs_to :user

  has_many :fights
  has_many :logs

  has_and_belongs_to_many :resources

  STATS = %w( attack defense hp )
  SLOTS = %w( helmet armor mail gloves bracers foots belt weapon shield ring necklace cloak pants )
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

  def try_skill_up(skill_name)
    case self[skill_name]
    when 0..50
      try_chance(percent: 50)
    when 50..100
      try_chance(percent: 30)
    when 100..150
      try_chance(percent: 20)
    when 150..200
      try_chance(percent: 15)
    when 200..250
      try_chance(percent: 10)
    when 250..300
      try_chance(percent: 7)
    when 300..350
      try_chance(percent: 5)
    when 350..400
      try_chance(percent: 2)
    end
  end 
end
