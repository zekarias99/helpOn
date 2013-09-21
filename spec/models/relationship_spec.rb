require 'spec_helper'

describe Relationship do

  let(:joiner) { FactoryGirl.create(:user) }
  let(:joined) { FactoryGirl.create(:user) }
  let(:relationship) { joiner.relationships.build(joined_id: joined.id) }

  subject { relationship }

  it { should be_valid }

   describe "joiner methods" do
    it { should respond_to(:joiner) }
    it { should respond_to(:joined) }
    its(:joiner) { should eq joiner }
    its(:joined) { should eq joined }
  end

  describe "when joiner id is not present" do
  	before { relationship.joiner_id = nil }
  	it { should_not be_valid }
  end

  describe "when joined id is not present" do
  	before { relationship.joined_id = nil }
  	it { should_not be_valid }
  end
end
