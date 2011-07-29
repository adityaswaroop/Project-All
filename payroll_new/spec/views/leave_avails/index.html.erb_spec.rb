require 'spec_helper'

describe "leave_avails/index.html.erb" do
  before(:each) do
    assign(:leave_avails, [
      stub_model(LeaveAvail,
        :empID => 1,
        :leaveID => 1,
        :leaveTakenDayPeriod => "Leave Taken Day Period"
      ),
      stub_model(LeaveAvail,
        :empID => 1,
        :leaveID => 1,
        :leaveTakenDayPeriod => "Leave Taken Day Period"
      )
    ])
  end

  it "renders a list of leave_avails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Leave Taken Day Period".to_s, :count => 2
  end
end
