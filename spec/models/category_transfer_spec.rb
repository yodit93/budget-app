require 'rails_helper'

RSpec.describe CategoryTransfer, type: :model do
  before(:all) do
    CategoryTransfer.destroy_all
    Category.destroy_all
    Transfer.destroy_all
    User.destroy_all
    @user = User.create(name: 'user', email: 'user3@gmail.com', password: '123456', confirmed_at: Time.now)
    sign_in @user
    @category = Category.create(name: 'category1', icon: 'icon', author: @user)
    @category.errors
    @category.valid?
    @transfer = Transfer.create(name: 'transfer1', amount: 100, author: @user)
    @category_transfer = CategoryTransfer.create(category_id: @category.id, transfer_id: @transfer.id)
  end
  it 'is valid with valid attributes' do
    expect(@category_transfer.category).equal?(@category)
    expect(@category_transfer.category.name).to eq(@category.name)
  end
end
