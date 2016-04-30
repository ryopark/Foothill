class SellBook < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :sell_book_comments, dependent: :destroy
  has_many :message_groups, dependent: :destroy

  validates :name, :prof_name, presence: true
  validates :in_class, inclusion: { in: [true, false] }
  validates :deanza_flag, inclusion: { in: [true, false] }
  validates :foothill_flag, inclusion: { in: [true, false] }

  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :message_groups

  acts_as_votable
end
