require 'spec_helper'

describe Highlight do

  before { @highlights = Highlight.new(highlight_attributes) }

  subject { @highlights }

  it {should respond_to (:description)}
  it {should respond_to (:deal_id)}

  describe "when fine_print is not present" do
    before { @highlights.description = " " }
    it { should_not be_valid }
  end
end
