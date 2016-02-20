require 'rails_helper'

RSpec.describe UserLesson do
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:lesson_id) }
end
