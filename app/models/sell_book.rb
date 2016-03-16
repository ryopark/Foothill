class SellBook < ActiveRecord::Base
  validates :name, :prof_name, presence: true
  validates :in_class, inclusion: { in: [true, false] }
  belongs_to :user, required: true
  has_many :photos, as: :photo
  accepts_nested_attributes_for :photos, allow_destroy: true
end
