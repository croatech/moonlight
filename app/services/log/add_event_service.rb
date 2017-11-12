class Log::AddEventService
  def initialize(player, event)
    @player = player
    @event = event
  end

  def call
    player.logs.create(body: event)
    player.logs.first.destroy if player.logs.count > Log::MAXIMUM_SIZE
    player.touch
    ws_stream
  end

  private

  attr_reader :player, :event

  def ws_stream
    ActionCable.server.broadcast("log_#{player.id}", event)
  end
end