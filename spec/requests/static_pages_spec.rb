require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { should have_content('Helpon') }
    it { should have_title(full_title('')) }
    it { should_not have_title(full_title('| Home')) }
  end

  describe "Help page" do

    before { visit help_path }    

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About Us page" do

    before { visit about_path }

    it { should have_content('About Us') }
    it { should have_title(full_title('About Us')) }
  end

  describe "How It Work's page" do

    before { visit how_it_works_path }

    it { should have_content("How It Work's") }
    it { should have_title(full_title('How It Works')) }
  end

  describe "Contact Us page" do

    before { visit contact_path }    

    it { should have_content("Contact Us") }
    it { should have_title(full_title('Contact Us')) }
  end

  it "should have the right link on the layout" do
    visit root_path
    click_link 'About Us'
    expect(page).to have_title(full_title('About Us'))
    click_link 'Sign in'
    expect(page).to have_title(full_title('Sign in'))
    click_link 'Contact Us'
    expect(page).to have_title(full_title('Contact Us'))
    click_link 'Home'
    expect(page).to have_title(full_title(''))
    click_link 'Help'
    expect(page).to have_title(full_title('Help'))
    click_link "How It Work's"
    expect(page).to have_title(full_title('How It Works'))    
    click_link "Helpon"
    expect(page).to have_title(full_title(''))    
    # click_link "Helpon"  Remember to use this test 01:21 lesson 5 movie. 
    # click_link "Whatever on the next page"
    # expect(page).to have_title(full_title('Any thing u expected'))    
  end
end