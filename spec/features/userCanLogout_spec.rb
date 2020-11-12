feature 'User can logout' do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, scope: :user)
    visit root_path
    click_on 'Logout'
  end

  it 'user stay on their homepage after succesful logout' do
    expect(current_path).to eq root_path
  end

  it 'user can see a success message after logout' do
    expect(page).to have_content 'Signed out successfully.'
  end

  it 'user can not see their name on the nav bar anymore' do
    expect(page).not_to have_content user.name
  end
end