module AuthenticationHelpers
  def sign_in(user)
    visit '/signin'
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password 
    click_button 'Sign in'
    page.should have_content("Helpon")
  end
end 