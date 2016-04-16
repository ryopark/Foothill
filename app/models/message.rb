class Message < ActiveRecord::Base
  belongs_to :message_group, required: true
  belongs_to :user, required: true

  validates :body, presence: true
end
