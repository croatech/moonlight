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
    increment_skill if player.try_skill_up(skill_name)
  end

  private

  def is_tool_wearing?
    player[slot_name] == resource.item_id
  end

  def increment_skill
    player.increment!(skill_name, 1)
  end
end
