class Resource::CollectService

  attr_reader :player, :resource, :slot_name

  def initialize(player, resource)
    @player = player
    @resource = resource
    @slot_name = "#{resource.type}_slot"
  end

  def call
    player.resources << resource if is_tool_wearing?
  end

  private

  def is_tool_wearing?
    player[slot_name] >= resource.item_id
  end
end
