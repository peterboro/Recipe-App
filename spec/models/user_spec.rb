require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Test User', role: 'admin')
  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a role' do
    user.role = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a role other than admin or user' do
    user.role = 'invalid'
    expect(user).to_not be_valid
  end

  it 'is not valid without a email' do
    user.email = nil
    expect(user).to_not be_valid
  end
end
