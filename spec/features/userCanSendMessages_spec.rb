feature 'User can send message' do
  let(:user) { FactoryBot.create(:user) }
  before do
  login_as(user, scope: :user)
  visit root_path
  click_on 'Inbox'
  click_on 'Compose'   
end

  context "Successfully send message [Happy Path]" do
  let(:sender) { FactoryBot.create(:user, email: 'sender@mail.com') }
  let(:receiver) { FactoryBot.create(:user, email: 'receiver@mail.com') }
    before do
      sender.send_message(sender, 'Lorem ipsum...', 'Subject')
      # select('Lucia', :from => 'Receipie')
      # fill_in "Subject", with: "Hej Hi Hello "
      # fill_in "Type your message here", with: "Random stuff"
      click_on "Send Message" 
    end
  end

    it 'User should see error message' do
      expect(current_path).to have_content "Your message was successfully sent!"
    end
end


  #   it 'User should see success message' do
  #     fill_in 'Name', with: 'user712'
  #     fill_in 'Email', with: 'user712@test.com'
  #     fill_in 'Password', with: '12345678'
  #     fill_in 'Password confirmation', with: '12345678'
  #     click_on 'Create'
  #     expect(page).to have_content "Welcome! You have signed up successfully."
  #   end
  # end


  #   let(:user) { FactoryBot.create(:user) }
# before do
#   login_as(user, scope: :user)
#   visit root_path