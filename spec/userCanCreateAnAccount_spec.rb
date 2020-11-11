feature 'User can create an account' do   

  context "Successfully create an account [Happy Path]" do
    before do
      visit root_path
      click_on 'Sign up'
    end

  it 'User should see success message' do
    fill_in 'new_name', with: 'user712'
    fill_in 'new_email', with: 'user712@test.com'
    fill_in 'new_password', with: '12345678'
    fill_in 'new_password_confirmation', with: '12345678'
    click_on 'Create'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

end
end

 
  # let(:user) { FactoryBot.create(:user) }
  # before do
  # visit root_path
  # click_on 'Sign up'
  # end

  # it 'User should be on home page' do
  #   article = Article.find_by(title: 'Happy holidays')
  #   expect(current_path).to eq article_path(article)
  # end

  # it 'User should see article title' do
  #   expect(page).to have_content 'Happy holidays'
  # end

  # it 'User should see article content' do
  #   expect(page).to have_content 'Buy your gifts now!'
  # end