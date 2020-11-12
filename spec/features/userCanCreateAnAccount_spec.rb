feature 'User can create an account' do   
  before do
    visit root_path 
    click_on 'Sign up'
  end

  context "Successfully create an account [Happy Path]" do

    it 'User should see success message' do
      fill_in 'Name', with: 'user712'
      fill_in 'Email', with: 'user712@test.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_on 'Create'
      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end

  context "User did't enter any name[Sad Path]" do
    before do
      fill_in 'Email', with: 'user712@test.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_on 'Create'
    end

    it 'User should see error message' do
      expect(page).to have_content "Name can't be blank"
    end
  end

  context "User did't enter any email[Sad Path]" do
    before do
      fill_in 'Name', with: 'user712'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_on 'Create'
    end

    it 'User should see error message' do
      expect(page).to have_content "Email can't be blank"
    end
  end

  context "User did't enter any password[Sad Path]" do
    before do
      fill_in 'Email', with: 'user712@test.com'
      fill_in 'Name', with: 'user712'
      fill_in 'Password confirmation', with: '12345678'
      click_on 'Create'
    end

    it 'User should see error message' do
      expect(page).to have_content "Password can't be blank"
    end
  end

  context "User did't enter any password confirmation[Sad Path]" do
    before do
      fill_in 'Name', with: 'user712'
      fill_in 'Email', with: 'user712@test.com'
      fill_in 'Password', with: '12345678'
      click_on 'Create'
    end

    it 'User should see error message' do
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end

  context "User entered a password shorter than 8 characters[Sad Path]" do
    before do
      fill_in 'Name', with: 'user712'
      fill_in 'Email', with: 'user712@test.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_on 'Create'
    end

    it 'User should see error message' do
      expect(page).to have_content "Password is too short (minimum is 8 characters)"
    end
  end
end