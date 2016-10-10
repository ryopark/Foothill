class Book < ActiveRecord::Base
  has_many :deals
  has_many :photos, as: :imageable, dependent: :destroy
end
