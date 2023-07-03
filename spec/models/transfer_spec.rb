require 'rails_helper'

RSpec.describe Transfer, type: :model do
  before(:all) do
    Transfer.destroy_all
    User.destroy_all
    @user = User.create(name: 'user', email: 'user@gmail.com', password: '123456', confirmed_at: Time.current)
    sign_in @user
    @transfer = Transfer.create(name: 'transfer', amount: 100, user: @user)
  end

  it 'should name be present' do
    @transfer.name = nil
    expect(@transfer).to_not be_valid
  end

  it 'should amount be present' do
    @transfer.amount = nil
    expect(@transfer).to_not be_valid
  end

  it 'should amount be numeric and greater than or equal to 0.1' do
    @transfer.amount = 'abc'
    expect(@transfer).to_not be_valid
  end
end
