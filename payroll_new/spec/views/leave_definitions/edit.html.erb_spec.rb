require 'spec_helper'

describe "leave_definitions/edit.html.erb" do
  before(:each) do
    @leave_definition = assign(:leave_definition, stub_model(LeaveDefinition,
      :leave_name => "MyString",
      :allotment => false,
      :affect_salary => false
    ))
  end

  it "renders the edit leave_definition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => leave_definitions_path(@leave_definition), :method => "post" do
      assert_select "input#leave_definition_leave_name", :name => "leave_definition[leave_name]"
      assert_select "input#leave_definition_allotment", :name => "leave_definition[allotment]"
      assert_select "input#leave_definition_affect_salary", :name => "leave_definition[affect_salary]"
    end
  end
end
