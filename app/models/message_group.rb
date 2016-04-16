class MessageGroup < ActiveRecord::Base
  belongs_to :sell_book, required: true

  validates :seller_id, presence: true
  validates :buyer_id, presence: true

  scope :request, -> current_user { where(buyer_id: current_user.id) }

  def create(message_group, buyer, seller)
    message_group.buyer_id = buyer.id
    message_group.seller_id = seller.id
    message_group.save!
  end
end
