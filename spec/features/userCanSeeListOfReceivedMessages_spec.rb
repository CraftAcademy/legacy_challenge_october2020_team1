feature 'User can see list of recived messages' do
  let(:sender) {FactoryBot.create(:user, name: 'sender', email: 'hellosender@abc.com')}
  let(:receiver) {FactoryBot.create(:user)}
  
  before do
    login_as(receiver, scope: :user)
    visit root_path
    sender.send_message(receiver, 'some example email from the sender', 'Subjec')
    click_on 'Inbox'
  end

  it 'Happypath user are redirected to inbox page' do
    expect(current_path).to eq mailbox_inbox_path
  end

  it 'Happypath user can see a recived message' do
    expect(page).to have_content 'some example'
  end
end