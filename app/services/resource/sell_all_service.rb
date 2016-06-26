class Resource::SellAllService

  attr_reader :player

  def initialize(player)
    @player = player
  end

  def call
    revenue = player.resources.pluck(:price).reduce(:+)
    player.increment!(:gold, revenue)
    player.resources.delete_all
    add_event_to_log(revenue)
  end

  private

  def add_event_to_log(revenue)
    event_message = "You have cell all resources for #{revenue} gold!"
    service = Log::AddEventService.new(player, event_message)
    service.call
  end
end