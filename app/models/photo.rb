class Photo < ActiveRecord::Base
  # Userも本のすべての写真をこのモデルで管理している。（polymorphicAssociation）
  belongs_to :imageable, polymorphic: true

  has_attached_file :image, styles: { medium: '320x320>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}
end
