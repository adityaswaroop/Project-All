require 'spec_helper'

describe "employees/edit.html.erb" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :employee_name => "MyString"
    ))
  end

  it "renders the edit employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employees_path(@employee), :method => "post" do
      assert_select "input#employee_employee_name", :name => "employee[employee_name]"
    end
  end
end
