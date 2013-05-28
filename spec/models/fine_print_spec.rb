require 'spec_helper'

describe FinePrint do

  before { @fine_prints = FinePrint.new(fine_print_attributes) }

  subject { @fine_prints }

  it {should respond_to (:description)}

  describe "when fine_print is not present" do
    before { @fine_prints.description = " " }
    it { should_not be_valid }
  end
end