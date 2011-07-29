require 'spec_helper'

describe "leave_avails/show.html.erb" do
  before(:each) do
    @leave_avail = assign(:leave_avail, stub_model(LeaveAvail,
      :empID => 1,
      :leaveID => 1,
      :leaveTakenDayPeriod => "Leave Taken Day Period"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Leave Taken Day Period/)
  end
end
