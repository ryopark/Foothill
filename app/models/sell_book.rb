class SellBook < ActiveRecord::Base
  validates :name, :prof_name, presence: true
  validates :in_class, inclusion: { in: [true, false] }
  belongs_to :user, required: true

  mount_uploader :image, ImageUploader
end
