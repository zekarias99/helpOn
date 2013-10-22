require 'spec_helper'

describe Picture do
  
  let(:user) { FactoryGirl.create(:user) }

  before do
    @picture = Picture.new(caption: 'My Dog', description: 'Lorem Epsem')
  end
end
