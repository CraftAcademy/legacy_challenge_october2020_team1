require 'rails_helper'
feature 'User can' do
    let(:sender) { FactoryBot.create(:user, name: 'Mr.sender', email: 'helloworld@mail.com') }
    #let(:receiver) { FactoryBot.create(:user, name: 'Mr.reciever', email: 'railsofunhaha@mail.com') }
    context "Successfully send message [Happy Path]" do
    before do
        login_as(sender, scope: :user)
        visit root_path
        click_on 'Inbox'
        click_on 'Compose'
        # save_and_open_page
        select 'Mr.sender', from: 'conversation_recipients'
        fill_in 'conversation_subject', with: 'user712'
        fill_in 'conversation_body', with: 'user712@test.com'
        click_on "Send Message" 
    end  
    it 'User should see error message' do
      expect(page).to have_content "Your message was successfully sent!"
    end
end
end





# require 'rails_helper'

# feature 'User can' do
#   let(:sender) { FactoryBot.create(:user) }
#   let(:receiver) { FactoryBot.create(:user, name: 'mrX', email: 'sender@mail.com') }

#   before do
#     login_as(sender, scope: :user)
#     visit root_path
#     click_on 'Inbox'
#     # click_on 'Compose'   
#   end

#   it 'User should see error message' do
#     expect(page).to have_content "Your message was successfully sent!"
#   end

# end