class Log::AddEventService

  attr_reader :player, :event

  def initialize(player, event)
    @player = player
    @event = event
  end

  def call
    player.logs.create(body: event)
    player.logs.first.destroy if player.logs.count > Log::MAXIMUM_SIZE
  end
end