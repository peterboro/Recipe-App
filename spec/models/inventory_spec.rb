require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject do
    @user = User.create(name: 'Test User', role: 'admin', email: 'tests@gmail.com', password: '123456')
    @inventory = Inventory.create(name: 'Test Inventory', user_id: @user.id, description: 'Test Description')
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
