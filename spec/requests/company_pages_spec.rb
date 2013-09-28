require 'spec_helper'

describe "Company pages" do

  subject { page }

  describe "index" do

    let(:company) { FactoryGirl.create(:company) }

    before(:each) do
      visit companies_path
    end

    it { should have_title('List Companies') }
    it { should have_content('List Companies') }

    it "should list each company" do
      Company.all.each do |company|
        expect(page).to have_selector('li', text: company.bussines_name)
        expect(page).to have_selector('li', text: company.city)
        expect(page).to have_selector('li', text: company.state)
      end
    end
  end

  describe "delete links" do

    it { should_not have_link('delete') }

    describe "as an admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
        visit companies_path
      end

      it { should have_link('delete', href: user_path(User.first)) }
      it "should be able to delete charity" do
        expect do
          click_link('delete', match: :first)
        end.to change(Company, :count).by(-1)
      end
      it { should_not have_link('delete'), href: user_path(admin) }
    end
  end
end

























































