require 'spec_helper'

describe User do

# this user is exist only in memory
  before do
    @user = User.new(name: "Example User", last_name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:avatar) }
  it { should respond_to(:full_name) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }
  it { should respond_to(:password_confirmation ) }
  it { should respond_to(:microposts) }
  it { should respond_to(:pictures) }
  it { should respond_to(:gravatar_url) }
  it { should respond_to(:feed) }
  it { should respond_to(:relationships) }
  it { should respond_to(:joined_users) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:joiners) }
  it { should respond_to(:joining?) }
  it { should respond_to(:join!) }
  it { should respond_to(:unjoin!) }
  it { should respond_to(:charities) }
  it { should respond_to(:companies)}

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end

  describe "when a name is not valid" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when a last name is not valid" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is too long" do
    before { @user.last_name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when the email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com A_USER@f.b.org frst.las@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is alraady taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example", last_name: "User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before do
        @user = User.new(name: "Zekarias", last_name: "Hartl", email: "mhartl@example.com",
                         password: "foobar", password_confirmation: nil)
    end
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end

    describe "remember token" do
     before { @user.save }
      its(:remember_token) { should_not be_blank }
    end
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMple.com" }
    
    it "it should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe "micropost association" do

    before { @user.save }

    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
    end

    let!(:newer_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
    end 
    
    it "should have the right microposts in the right order" do
      expect(@user.microposts.to_a).to eq [newer_micropost, older_micropost]
    end

    it "should destroy associated microposts" do
      microposts = @user.microposts.to_a
      @user.destroy
      expect(microposts).not_to be_empty
      microposts.each do |micropost|
        expect(Micropost.where(id: micropost.id)).to be_empty
      end
    end

    describe "status" do
      let(:unjoined_post) do
        FactoryGirl.create(:micropost, user: FactoryGirl.create(:user))
      end
      let(:joined_user) { FactoryGirl.create(:user) }

      before do
        @user.join!(joined_user)
        3.times { joined_user.microposts.create!(content: "Lorem ipsum") }
      end

      its(:feed) { should include(newer_micropost) }
      its(:feed) { should include(older_micropost) }
      its(:feed) { should_not include(unjoined_post) }
      its(:feed) do
        joined_user.microposts.each do |micropost|
          should include(micropost)
        end
      end
    end
  end

  describe "joining" do
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      @user.save
      @user.join!(other_user)
    end

    it { should be_joining(other_user) }
    its(:joined_users) { should include(other_user) }

    describe "joined user" do
      subject { other_user }
      its(:joiners) { should include(@user) }
    end

    describe "unjoining" do
      before { @user.unjoin!(other_user) }

      it { should_not be_joining(other_user) }
      its(:joined_users) { should_not include(other_user) }
    end
  end

  describe "company associations" do
    before { @user.save }
      let!(:older_company) do
        FactoryGirl.create(:company, user: @user, created_at: 1.day.ago)
      end
      let!(:newer_company) do
        FactoryGirl.create(:company, user: @user, created_at: 1.hour.ago)
      end

    it "should have the right companies in the right order" do
      expect(@user.companies.to_a).to eq [newer_company, older_company]
    end

    it "should destroy associated companies" do
      companies = @user.companies.to_a
      @user.destroy
      expect(companies).not_to be_empty
      companies.each do |company|
        expect(Company.where(id: company.id)).to be_empty
      end
    end
  end

  describe "charity association" do

    before { @user.save }

    let!(:older_charity) do
      FactoryGirl.create(:charity, user: @user, created_at: 1.day.ago)
    end

    let!(:newer_charity) do
      FactoryGirl.create(:charity, user: @user, created_at: 1.hour.ago)
    end 
    
    it "should have the right charities in the right order" do
      expect(@user.charities.to_a).to eq [newer_charity, older_charity]
    end

    it "should destroy associated charities" do
      charities = @user.charities.to_a
      @user.destroy
      expect(charities).not_to be_empty
      charities.each do |charity|
        expect(Charity.where(id: charity.id)).to be_empty
      end
    end
  end

  describe "picture association" do
  
    # Here we save user to get id of the user
    # let! force to save in the database

    before { @user.save }
    let!(:older_picture) do
      FactoryGirl.create(:picture, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_picture) do
      FactoryGirl.create(:picture, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right pictures in the right order" do
      expect(@user.pictures.to_a).to eq [newer_picture, older_picture]
    end

    it "should destroy associated pictures" do
      pictures = @user.pictures.to_a
      @user.destroy
      expect(pictures).not_to be_empty
      pictures.each do |picture|
        expect(Picture.where(id: picture.id)).to be_empty
      end
    end
  end
end














































