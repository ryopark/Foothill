class UserLesson < ActiveRecord::Base
  belongs_to :lessons
  belongs_to :users
end
