class Log::EventsGetService

  attr_reader :player

  def initialize(player)
    @player = player
  end

  def call
    player.logs.order('id DESC').limit(50)
  end
end