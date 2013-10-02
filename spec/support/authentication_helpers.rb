module AuthenticationHelpers
  def sign_in(user)
    visit '/signin'
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password 
    click_button 'Sign in'
    page.should have_content("Helpon")
  end
end 

RSpec.configure do |c|
	c.include AuthenticationHelpers, type: :view
end


module AuthHelpers
  def sign_in(user)
    session[:user_id] = user.id
  end
end
RSpec.configure do |c|
  c.include AuthHelpers, type: :view
end