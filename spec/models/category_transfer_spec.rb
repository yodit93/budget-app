require 'rails_helper'

RSpec.describe CategoryTransfer, type: :model do
  before(:all) do
    @user = User.create(name: 'user', email: 'user1@gmail.com', password: '123456', confirmed_at: Time.now)
    sign_in @user
    @category = Category.create(name: 'category1', icon: 'icon', author_id: @user.id)
    @transfer = Transfer.create(name: 'transfer1', amount: 100, author_id: @user.id)
    @category_transfer = CategoryTransfer.create(category_id: @category.id, transfer_id: @transfer.id)
  end
  it 'is valid with valid attributes' do
    expect(@category_transfer.category).equal?(@category)
  end
end
