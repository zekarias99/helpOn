require 'spec_helper'

describe "Status pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit statuses_path
    end

    it { should have_title('All statuses') }
    it { should have_selector('h1', text: "All of the statuses") }

    it "should list each statuses" do
      Status.all.each do |status|
        expect(page).to have_selector('strong', text: status.user.full_name)
        expect(page).to have_selector('p', text: status.content)
      end
    end
  end

  describe "show" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit status_url(status)
    end

    it { should have_title('Status') }
    it { should have_text(status.user.full_name)}
  end

  describe "status destruction" do
    before { FactoryGirl.create(:status, user: user) }
    
    describe "as correct user" do
      before { visit root_path }
      
      it "should delete a status" do
        expect { click_link "delete" }.to change(Status, :count).by(-1)
      end
    end
  end
end
