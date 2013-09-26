require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit users_path
    end

    it { should have_title('All users') }
    it { should have_content('All users') }

    it "should list each user" do
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end
  end

  describe "delete links" do

    it { should_not have_link('delete') }

    describe "as an admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
        visit users_path
      end

      it { should have_link('delete', href: user_path(User.first)) }
      it "should be able to delete another user" do
        expect do 
         click_link('delete', match: :first)
       end.to change(User, :count).by(-1)
      end
      it { should_not have_link('delete', href: user_path(admin)) }
    end
  end

  describe "profile page" do

    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }

    before { visit user_path(user) }

    it { should have_title(user.name) }
    it { should have_content(user.name) }
    
    describe "microposts" do
      it { should have_content(m1.content) }
      it { should have_content(m2.content) }
      it { should have_content(user.microposts.count) }   
    end

    describe "charities" do

    let(:user) { FactoryGirl.create(:user) }
    let!(:c1) { FactoryGirl.create(:charity, user: user, charity_name: "UNHCR1",  
                                registered_charity_number: "111048", 
                                  first_name: "Foo1", last_name: "Bar1",  
                                  job_title: "Manager1", 
                                  email_address: "manager1@unhcr.gov",
                                  telephone_number: "111048",
                                  i_agree_to_the: true,
                                  description: "Human Right",
                                  address_1: "3022 NE 140th St",
                                  address_2: "3022 NE 140th St",
                                  state: "Seattle",
                                  zip: "98125",
                                  country: "USA",
                                  website: "unhcr1.org",
                                  pick_a_category: "International",
                                  city_id: "1", user_id: user.id) }
    let!(:c2) { FactoryGirl.create(:charity, user: user, charity_name: "UNHCR",  
                                registered_charity_number: "111048", 
                                  first_name: "Foo", last_name: "Bar",  
                                  job_title: "Manager", 
                                  email_address: "manager@unhcr.gov",
                                  telephone_number: "111048",
                                  i_agree_to_the: true,
                                  description: "Human Right",
                                  address_1: "3022 NE 140th St",
                                  address_2: "3022 NE 140th St",
                                  state: "Seattle",
                                  zip: "98125",
                                  country: "USA",
                                  website: "unhcr.org",
                                  pick_a_category: "International",
                                  city_id: "1", user_id: user.id) }

    before { visit user_path(user) } 

      describe "charities" do
        it { should have_content(c1.charity_name) }
        it { should have_content(c2.charity_name) }
        it { should have_content(user.charities.count) }   
      end
    end

    describe "join/unjoin buttons" do
      let(:other_user) { FactoryGirl.create(:user) }
      before { sign_in user }

      describe "joining a user" do
        before { visit user_path(other_user) }

        it "should increment the joined user count" do
          expect do
            click_button "Join"
          end.to change(user.joined_users, :count).by(1)
        end

        it "should increment the other user's joiners count" do
          expect do
            click_button "Join"
          end.to change(other_user.joiners, :count).by(1)
        end

        describe "toggling the button" do
          before { click_button "Join" }
          it { should have_xpath("//input[@value='Unjoin']") }
        end
      end

      describe "unjoining a user" do
        before do
          user.join!(other_user)
          visit user_path(other_user)
        end

        it "should decrement the joined user count" do
          expect do
            click_button "Unjoin"
          end.to change(user.joined_users, :count).by(-1)
        end

        it "should decrement the other user's joiners count" do
          expect do
            click_button "Unjoin"
          end.to change(other_user.joiners, :count).by(-1)
        end

        describe "toggling the button" do
          before { click_button "Unjoin" }
          it { should have_xpath("//input[@value='Join']") }
        end
      end
    end
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do

        before { click_button submit }

        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_content('Welcome to HelpOn') }        
      end
    end

    describe "after submission" do
      
    before { click_button submit }
      it { should have_title('Sign up') }
      it { should have_content('error') }
      it { should_not have_content('Password digest') }
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end

    describe "forbidden attributes" do
      let(:params) do
        { user: { admin: true, password: user.password,
                  password_confirmation: user.password } }
      end
      before { patch user_path(user), params }
      specify { expect(user.reload).not_to be_admin }
    end
  end

  describe "joining/joiners" do
    let(:user) { FactoryGirl.create(:user) }
    let(:other_user) { FactoryGirl.create(:user) }
    before { user.join!(other_user) }

    describe "joined users (joining)" do
      before do
        sign_in user
        visit joining_user_path(user)
      end

      it { should have_title(full_title('Joining')) }
      it { should have_selector('h3', text: ('Joining')) }
      it { should have_link(other_user.name, href: user_path(other_user)) }
    end

    describe "joiners (joining)" do
      before do
        sign_in other_user
        visit joiners_user_path(other_user)
      end

      it { should have_title(full_title('Joiners')) }
      it { should have_selector('h3', text: ('Joiners')) }
      it { should have_link(user.name, href: user_path(user)) }
    end
  end
end