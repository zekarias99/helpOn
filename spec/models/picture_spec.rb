require 'spec_helper'

describe Picture do
  
  let(:user) { FactoryGirl.create(:user) }

  before do
    @picture = Picture.new(caption: 'My Dog', description: 'Lorem Epsem', user_id: user.id)
  end

  subject { @picture }

  it { should responed_to(:caption) }
  it { should responed_to(:description) }
  it { should responed_to(:user_id) }
end

