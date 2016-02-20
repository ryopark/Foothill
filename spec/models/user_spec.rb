require 'rails_helper'

RSpec.describe User do
  subject(:user) { User.new(username: 'abc', email: 'abc@example.com', password: 'passwords') }

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to be_valid }
end
