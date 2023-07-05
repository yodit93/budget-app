require 'rails_helper'
RSpec.describe 'Category index', type: :system do
  before(:each) do
        @user = User.create(name: 'Tom', email: 'nahom@gmail.com', password: '123456', confirmed_at: Time.now)
        sign_in @user
        @category = @user.categories.create(name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png')
  end
  describe 'index' do
    before(:each) do
     visit categories_path
    end
    it 'shows the title' do
        expect(page).to have_content('Categories')
    end
    it 'shows the name' do
      expect(page).to have_content(@category.name)
    end
    it 'Shows the icon' do
        expect(page).to have_css("img[src*='#{@category.icon}']")
    end
    it 'Shows the date' do
       expect(page).to have_content(@category.created_at.strftime('%d %B %Y'))
    end

    it 'Shows the total_amount' do
        expect(page).to have_content(@category.transfers.sum(:amount))
    end
  end
  describe 'The links on the index page' do
    before(:each) do
        visit categories_path
    end
    it 'Shows the New category button' do
        expect(page).to have_link('New Category', href: new_category_path)
    end 
  end
end