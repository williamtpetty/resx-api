class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :receiver_id, :last_message, :recent_user_name

  belongs_to :sender
  belongs_to :receiver
  has_many :messages

  def last_message
    object.messages.last
  end

  def recent_user_name
    if last_message
      last_user_id = object.messages.last.user_id
      user = User.find_by(id: last_user_id)
      users_name = "#{user.first_name} #{user.last_name}"
      return users_name
    end
  end
end
