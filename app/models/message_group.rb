class MessageGroup < ActiveRecord::Base
  belongs_to :sell_book, required: true
  has_many :messages, dependent: :destroy

  validates :seller_id, presence: true
  validates :buyer_id, presence: true

  def create(message_group, buyer, seller)
    message_group.buyer_id = buyer.id
    message_group.seller_id = seller.id
    message_group.save!
  end
end
