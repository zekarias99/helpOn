require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { should have_content('Helpon') }
    it { should have_title("Helpon") }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do

    before { visit help_path }    

    it { should have_content('Help') }
    it { should have_title("Helpon | Help") }
  end

  describe "About Us page" do

    before { visit about_path }

    it { should have_content('About Us') }
    it { should have_title("Helpon | About Us") }
  end

  describe "How It Work's page" do

    before { visit how_it_works_path }

    it { should have_content("How It Work's") }
    it { should have_title("Helpon | How It Works") }
  end

  describe "Contact Us page" do

    before { visit contact_path }    

    it { should have_content("Contact Us") }
    it { should have_title("Helpon | Contact Us") }
  end
end