class Log::AddEventService

  attr_reader :player, :event

  def initialize(player, event)
    @player = player
    @event = event
  end

  def call
    player.logs.create(body: event)
  end
end