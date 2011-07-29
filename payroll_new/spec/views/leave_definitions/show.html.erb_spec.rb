require 'spec_helper'

describe "leave_definitions/show.html.erb" do
  before(:each) do
    @leave_definition = assign(:leave_definition, stub_model(LeaveDefinition,
      :leave_name => "Leave Name",
      :allotment => false,
      :affect_salary => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Leave Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
