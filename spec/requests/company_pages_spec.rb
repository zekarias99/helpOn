require 'spec_helper'

describe "Company pages" do

  subject { page }

  describe "index" do

    let(:company) { FactoryGirl.create(:company) }

    before(:each) do
      visit companies_path
    end
  

   describe "index page: delete links" do

    it { should_not have_link('Delete') }
    it { should_not have_link('New Company') }
    it { should_not have_link('Show') }
    it { should_not have_link('Back to List') }

    describe "as an admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
        visit companies_path
      end

      it { should have_title('List Companies') }
      it { should have_content('List Companies') }
      it { should have_link('Delete') }
      it { should have_link('Show') }
    

        it "should list each company" do
          Company.all.each do |company|
            expect(page).to have_selector('li', text: company.bussines_name)
            expect(page).to have_selector('li', text: company.city)
            expect(page).to have_selector('li', text: company.state)
          end
        end

        it "should be able to delete campany" do
          expect do
            click_link('Delete')
          end.to change(Company, :count).by(-1)
        end
      end
    end
    describe "show page" do
      it { should_not have_title('Company') }
      it { should_not have_link('Edit') }
      it { should_not have_link('Remove') }
      it { should_not have_link('View All') }

      describe "as an admin user have: Remove & View All" do
        let!(:c1) { FactoryGirl.create(:company, email_address: "teshome@wanza.com") }
        let!(:c2) { FactoryGirl.create(:company, email_address: "anotheremail@wanza.com") }
        let(:admin) { FactoryGirl.create(:admin) }

        before do
          sign_in admin
          visit company_path(company)
        end

        it { should have_link('Remove') }
        it { should have_link('View All') }
      end
    end
  end

  describe "get featured page " do
    before { visit new_company_path}

    it { should have_content('Tell us about your business') }
    it { should have_title('Get Featured') }
  end
end

