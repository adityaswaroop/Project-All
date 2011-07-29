require 'spec_helper'

describe "Using Mocks" do

  it 'can declare method stubs inline' do
    m = mock("A mock", :foo => 4+4)
    m.should respond_to(:foo)
    m.foo.should == 8
  end

  it 'with explicit stub methods' do
    m = mock("A Mock")
    m.stub(:foo)
    m.stub!(:bar).and_return("Hello World")

    m.should respond_to(:foo)
    m.should respond_to(:bar)
  end

  it 'expects invocations' do
    m = mock("A Mock")

    m.should_receive(:foo)
    m.foo
  end
end