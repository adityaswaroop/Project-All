require 'spec_helper'

describe Role do
  before(:each) do
    @valid_attribute = {
      :role_type => "Admin"
    }
  end

  describe "Validation" do
    it "should validate attribute" do
      role_new = Role.new(@valid_attribute)
      role_new.should be_valid
      role_new.errors.should be_empty
    end

    it "should catch invalid role_type" do
      [nil,"","$$@!#"].each do |n|
        role_new = Role.new(@valid_attribute.merge(:role_type => n))
        role_new.should_not be_valid
        role_new.errors[:role_type].should_not be_empty
      end
    end
  end

  describe "Create Role" do
    it "should create new Role with given valid attributes" do
      lambda {
        Role.create(@valid_attribute)
      }.should change(Role,:count).by(1)
    end
  end

  describe "Association" do
    it { should have_and_belong_to_many(:users) }
  end
end