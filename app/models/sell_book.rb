class SellBook < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :photos, as: :imageable

  validates :name, :prof_name, presence: true
  validates :in_class, inclusion: { in: [true, false] }
  validates :deanza_flag, inclusion: { in: [true, false] }
  validates :foothill_flag, inclusion: { in: [true, false] }

  accepts_nested_attributes_for :photos
end
