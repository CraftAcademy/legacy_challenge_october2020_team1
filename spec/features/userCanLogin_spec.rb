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


  end
end