class Resource::CollectService

  attr_reader :player, :resource, :slot_name, :skill_name

  def initialize(player, resource)
    @player = player
    @resource = resource
    @slot_name = "#{resource.type}_slot"
    @skill_name = "#{resource.type}_skill"
  end

  def call
    player.resources << resource if is_tool_wearing?
    increment_skill if successful_outcome?
  end

  private

  def is_tool_wearing?
    player[slot_name] == resource.item_id
  end

  def increment_skill
    player.increment!(skill_name, 1)
  end

  def successful_outcome?
    case player[skill_name]
    when 0..50
      true
    when 50..100
      1 == rand(1..2)
    when 100..150
      1 == rand(1..3)
    when 150..200
      1 == rand(1..4)
    when 200..250
      1 == rand(1..5)
    when 250..300
      1 == rand(1..6)
    when 300..350
      1 == rand(1..10)
    end
  end
end
