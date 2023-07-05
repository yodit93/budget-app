require 'rails_helper'
RSpec.describe 'Transfer index', type: :system do
    before(:each) do
        @user = User.create(name: 'Tom', email: 'nahom@gmail.com', password: '123456', confirmed_at: Time.now)
        sign_in @user
        @category = @user.categories.create(name: 'category1', icon: 'https://i.ibb.co/gm68B4C/Mc-Donalds.png')
        trans = @user.transfers.create(name: 'transfer1', amount: 100)
        CategoryTransfer.create(category: @category, transfer: trans)
        @transfer = @category.transfers.first
    end
    describe 'The content of index page' do
        before(:each) do
            visit category_transfers_path(@category)
        end
        it 'shows the title' do 
            expect(page).to have_content('Transfers')
        end
        it 'shows the category name' do
            expect(page).to have_content(@category.name)
        end
        it 'shows the total amount' do
            expect(page).to have_content(@category.transfers.sum(:amount))
        end
        it 'shows the icon' do
            expect(page).to have_css("img[src*='#{@category.icon}']")
        end
        it 'shows the name' do
            expect(page).to have_content(@transfer.name)
        end
    end
    describe 'The links on the index page' do
        before(:each) do
            visit category_transfers_path(@category)
        end
        it 'Shows the Back button' do
            expect(page).to have_link(href: categories_path)
        end
        it 'Shows the New transfer button' do
            expect(page).to have_link('New Transfer', href: new_category_transfer_path(@category))
        end
    end 
end

