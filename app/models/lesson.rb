class Lesson < ActiveRecord::Base
  validates :name, :prof_name, presence: true
  validates :in_class, inclusion: { in: [true, false] }
  has_many :user_lessons
  has_many :users, through: :user_lessons
end
