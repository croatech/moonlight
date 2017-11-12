class Events::AddService
  def initialize(player, event)
    @player = player
    @event = event
  end

  def call
    player.events.create(body: event)
    player.events.first.destroy if player.events.count > Event::MAXIMUM_SIZE
    player.touch
    ws_publish
  end

  private

  attr_reader :player, :event

  def ws_publish
    ActionCable.server.broadcast("events_#{player.id}", event)
  end
end