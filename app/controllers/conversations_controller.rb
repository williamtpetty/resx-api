class ConversationsController < ApplicationController

  def index
    conversations = current_user.conversations
    render json: conversations
  end
  
  def create
    conversation = Conversation.new(
      sender_id: current_user.id,
      receiver_id: params[:receiver_id],
    )
    if conversation.save
      # message = Message.new( #This has been added
      #   user_id: current_user.id,
      #   body: params[:body],
      #   conversation_id: conversation.id,
      # )
      # message.save
      render json: conversation
    else
      render json: {errors: conversation.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    conversation = Conversation.find(params[:id])
    if current_user.id == conversation.sender_id || current_user.id == conversation.receiver_id
      render json: conversation, include: "messages.user"
    end
  end
  
  def destroy
    conversation = Conversation.find(params[:id])
    if current_user.id == conversation.sender_id || current_user.id == conversation.receiver_id
      conversation.destroy
      render json: {message: "This conversation has been deleted"}
    end
  end

end
