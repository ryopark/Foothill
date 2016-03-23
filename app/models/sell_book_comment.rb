class SellBookComment < ActiveRecord::Base
  belongs_to :sell_book, required: true
  belongs_to :user, required: true

  validates :body, presence: true
end
