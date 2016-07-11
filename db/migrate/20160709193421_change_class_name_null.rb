class ChangeClassNameNull < ActiveRecord::Migration
  change_column_null :sell_books, :class_name, false
  change_column_default :sell_books, :class_name, ''
end
