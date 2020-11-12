feature 'User can' do
  let(:sender) { FactoryBot.create(:user, email: 'sender@mail.com') }
  before do
  login_as(sender, scope: :user)
  visit root_path
  click_on 'Inbox'
  click_on 'Compose'   
end

  context "Successfully send message [Happy Path]" do |name|
  let(:sender) { FactoryBot.create(:user, email: 'sender@mail.com') }
  let(:receiver) { FactoryBot.create(:user, email: 'receiver@mail.com') }
    before do
      # visit new_conversation_path
      # sender.send_message(receiver, 'Lorem ipsum...', 'Subject')
      select_from_chosen(receiver.name, from: conversation_recipients)
      # @receiver = User.find_by(name: name)
      # @user.send_message(@receiver, 'Lorem ipsum...', 'Subject')
      fill_in 'Subject', with: 'user712'
      fill_in 'Message', with: 'user712@test.com'
      click_on "Send Message" 
    end
  end

    it 'User should see error message' do
      expect(page).to have_content "Your message was successfully sent!"
    end
end