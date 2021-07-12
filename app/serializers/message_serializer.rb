class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :body, :created_at

  belongs_to :user
end
