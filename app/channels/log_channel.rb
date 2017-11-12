class LogChannel < ApplicationCable::Channel
  def subscribed
    stream_from "log_#{current_user.player.id}"
  end
end
