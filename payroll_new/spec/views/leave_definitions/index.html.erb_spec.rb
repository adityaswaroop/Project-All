require 'spec_helper'

describe "leave_definitions/index.html.erb" do
  before(:each) do
    assign(:leave_definitions, [
      stub_model(LeaveDefinition,
        :leave_name => "Leave Name",
        :allotment => false,
        :affect_salary => false
      ),
      stub_model(LeaveDefinition,
        :leave_name => "Leave Name",
        :allotment => false,
        :affect_salary => false
      )
    ])
  end

  it "renders a list of leave_definitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Leave Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
