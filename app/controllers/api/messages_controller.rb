class Api::MessagesController < ApplicationController
  def index
    render json: Message.includes(:player).limit(50).order(id: :desc)
  end

  def create
    message = current_player.messages.new(message_params)
    if message.valid?
      message.save
      ActionCable.server.broadcast('chat', MessageSerializer.new(message))
      render json: message
    else
      render json: message.errors.full_messages
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :recipient_id)
  end
end
