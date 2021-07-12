class MessagesController < ApplicationController

  skip_before_action :authenticate_user

  def index
    messages = Message.all
    render json: messages.as_json
  end
  
  def create
    message = Message.new(
      user_id: current_user.id,
      body: params[:body]
    )
    if message.save
      ActionCable.server.broadcast "messages_channel", message
    else
      render json: { errors: message.errors.full_messages}, status: :bad_request
    end
  end

end
