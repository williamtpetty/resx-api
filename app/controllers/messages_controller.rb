class MessagesController < ApplicationController

  skip_before_action :authenticate_user

  def index
    messages = Message.all
    render json: messages.order(:created_at => :desc)
  end
  
  # def create
  #   message = Message.new(
  #     user_id: params[:user_id],
  #     body: params[:body],
  #     conversation_id: params[:conversation_id],
  #   )
  #   if message.save
  #     ActionCable.server.broadcast "messages_channel", message
  #   else
  #     render json: { errors: message.errors.full_messages}, status: :bad_request
  #   end
  # end

  def create
    message = Message.new(
      user_id: current_user.id,
      body: params[:body], 
      conversation_id: params[:conversation_id]
    )
    if message.save
      ActionCable.server.broadcast "messages_channel", {id: message.id, body: message.body, user: message.user} 
    else
      render json: {errors: message.errors.full_messages}, status: :unprocessable_entity
    end
  end
 
end


