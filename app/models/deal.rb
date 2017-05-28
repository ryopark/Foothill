class Deal < ActiveRecord::Base
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :book
end
