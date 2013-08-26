require 'spec_helper'

describe "Status pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

    describe "status creation" do
    	before { visit root_path }

    	describe "with invalid  information" do

    	  it "should not create a status" do
    	  	expect { click_button "Post" }.not_to change(Status, :count)
    	  end

    	  describe "error messages" do
    	  	before { click_button "Post" }
    	  	it { should have_content('error') }
    	  end
    	end
    end

    describe "states detruction" do
      before { FactoryGirl.create(:status, user: user) }

      describe "as a correct user" do
        before { visit root_path }
    
        it "should delete a status" do
          expect{ click_link "delete" }.to change(Status, :count).by(-1)
        end
      end
    end
end
