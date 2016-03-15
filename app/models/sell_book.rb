class SellBook < ActiveRecord::Base
  validates :name, :prof_name, presence: true
  validates :in_class, inclusion: { in: [true, false] }
  belongs_to :user, required: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}
end
