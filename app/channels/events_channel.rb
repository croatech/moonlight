class EventsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "events_#{current_user.player.id}"
  end
end
