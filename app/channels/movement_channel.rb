class MovementChannel < ApplicationCable::Channel
  def subscribed
    stream_from "movement_#{current_user.player.active_movement.id}"
  end
end
