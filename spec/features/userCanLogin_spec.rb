feature 'User can login' do
  let(:user){FactoryBot.create(:user)}

  before do
    visit root_path
    click_on "Login"
  end

  context 'happypath: succesful login' do
    before do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"
    end

    it 'user get redirected to their homepage after succesful login' do
      expect(current_path).to eq root_path
    end

    it 'user can see a success message' do
      expect(page).to have_content "Signed in successfully."
    end

    it 'user can see their name on the nav bar' do
      expect(page).to have_content user.name
    end
  end

  context 'sadpath: user types a wrong email address' do
    before do
      fill_in "Email", with: 'user123.email'
      fill_in "Password", with: user.password
      click_on "Log in"
    end

    it 'User should see an error message' do
      expect(page).to have_content 'Invalid Email or password.'
    end  
  end
end