require 'spec_helper'

describe "line_items/index" do
  before(:each) do
    assign(:line_items, [
      stub_model(LineItem,
        :deal => nil,
        :cart => nil
      ),
      stub_model(LineItem,
        :deal => nil,
        :cart => nil
      )
    ])
  end

  it "renders a list of line_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
