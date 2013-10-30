require 'spec_helper'

describe "Charity pages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:charity) { FactoryGirl.create(:charity)  }

  before { sign_in user }

  describe "charity creation" do
    before { visit new_charity_path }

    describe "invalid information" do
      
      it "should not create a charity" do
        expect { click_button "Create Charity" }.not_to change(Charity, :count)
      end

      describe "error messages" do
        before { click_button "Create Charity" }
        it { should have_content('error') }
      end
    end
  end

  describe "charity edition" do
    before { visit edit_charity_path }

    

      describe "error messages" do
        before { click_button "Save changes" }
        it { should have_content('error') }
      end
 
  end

  describe "charity destruction" do
    before { FactoryGirl.create(:charity, user: user) }

    describe "as correct user" do
      before { visit user_path(user) }

      it "should delete a charity" do
        expect { click_link "delete" }.to change(Charity, :count).by(-1)
      end
    end
  end
end
