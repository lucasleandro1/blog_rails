require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'is valid with valid attributes' do
    user = User.new(email: 'user@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(password: 'password')
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = User.new(email: 'user@example.com')
    expect(user).to_not be_valid
  end
end
