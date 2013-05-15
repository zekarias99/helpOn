require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Helpon'" do
      visit '/static_pages/home'
      expect(page).to have_content('Helpon')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("Helpon")
    end
    it "It should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("Helpon | Help")
    end
  end

  describe "About Us page" do

    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title("Helpon | About Us")
    end
  end

  describe "How It Work's page" do

    it "should have the content 'How It Work's'" do
      visit how_it_works_path
      expect(page).to have_content("How It Work's")
    end

    it "should have the title 'How It Work'" do
      visit how_it_works_path
      expect(page).to have_title("Helpon | How It Works")
    end
  end

  describe "Contact Us page" do

    it "should have the content 'Contact Us'" do
      visit contact_path
      expect(page).to have_content("Contact Us")
    end

    it "should have the title 'Contact Us'" do
      visit contact_path
      expect(page).to have_title("Helpon | Contact Us")
    end
  end
end