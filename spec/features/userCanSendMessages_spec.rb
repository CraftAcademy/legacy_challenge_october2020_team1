feature 'User can' do
  let(:sender) { FactoryBot.create(:user) }
  let(:receiver) { FactoryBot.create(:user, name: 'Mr.sender', email: 'helloworld@mail.com') }
  
  before do
    login_as(sender, scope: :user)
    visit root_path
    click_on 'Inbox'
    click_on 'Compose'   
  end

  context "Successfully send message [Happy Path]" do
    before do
      visit new_conversation_path
      select 'MyString', from: 'conversation_recipients'
      fill_in 'conversation_subject', with: 'some example'
      fill_in 'conversation_body', with: 'user712@test.com'
      click_on "Send Message" 
    end
    
    it 'User should see successful message' do
      expect(page).to have_content "Your message was successfully sent!"
    end
  end

  context "Unsuccessfully send message [Sad Path]" do
    before do
      visit new_conversation_path
      select 'MyString', from: 'conversation_recipients'
      fill_in 'conversation_subject', with: ' '
      fill_in 'conversation_body', with: ' '
      click_on "Send Message" 
    end

    it 'User should see error message' do
      expect(page).to have_content "There was an error, your message was not sent!"
    end
  end
end