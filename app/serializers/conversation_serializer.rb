class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :receiver_id, :last_message

  belongs_to :sender
  belongs_to :receiver
  has_many :messages

  def last_message
    object.messages.last
  end
end
