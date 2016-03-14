class UserLesson < ActiveRecord::Base
  belongs_to :sell_books
  belongs_to :users
end
