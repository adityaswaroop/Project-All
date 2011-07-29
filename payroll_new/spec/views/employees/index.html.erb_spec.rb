require 'spec_helper'

describe "employees/index.html.erb" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :employee_name => "Employee Name"
      ),
      stub_model(Employee,
        :employee_name => "Employee Name"
      )
    ])
  end

  it "renders a list of employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Employee Name".to_s, :count => 2
  end
end
