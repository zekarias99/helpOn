require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Helpon'" do
      visit '/static_pages/home'
      expect(page).to have_content('Helpon')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Helpon | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Helpon | Help")
    end
  end

  describe "About Us page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("Helpon | About Us")
    end
  end

  describe "How It Work's page" do

    it "should have the content 'How It Work's'" do
      visit '/static_pages/how_it_works'
      expect(page).to have_content("How It Work's")
    end

    it "should have the title 'How It Work'" do
      visit '/static_pages/how_it_works'
      expect(page).to have_title("Helpon | How It Works")
    end
  end

  describe "Contact Us page" do

    it "should have the content 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_content("Contact Us")
    end

    it "should have the title 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_title("Helpon | Contact Us")
    end
  end
end