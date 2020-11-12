feature 'User can see list of recived messages' do
  let(:user) {FactoryBot.create(:user)}
  
  before do
    login_as(user, scope: :user)
    visit root_path
    click_on 'Inbox'
  end

  it 'user are redirected to inbox page' do
    expect(current_path).to eq mailbox_inbox_path
  end










end