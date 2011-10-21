require 'spec_helper'

describe User do
  before(:each) do
     @valid_attribute = {
          :name => "Aditya Swaroop",
          :email => "adi@gmail.com",
          :username => "aditya",
          :password => "aditya"
      }
     @user = User.new
  end

  describe "Validating Attributes" do

    describe "Validate @valid_attribute" do

      it "should validate all attributes" do
        user_new = User.new(@valid_attribute)
        user_new.should be_valid
        user_new.errors.should be_empty
      end

    end

    describe "Validating Name" do

      it "should catch invalid name" do
        [nil,"","$$adi"].each do |n|
          user_new = User.new(@valid_attribute.merge(:name => n))
          user_new.should_not be_valid
          user_new.errors[:name].should_not be_empty
        end
      end

    end

    describe "Validating Email" do

      it "should catch invalid email" do
        [nil,"","$$adi"].each do |e|
          user_new = User.new(@valid_attribute.merge(:email => e))
          user_new.should_not be_valid
          user_new.errors[:email].should_not be_empty
        end
      end

      it "check for unique email" do
        User.create(@valid_attribute)
        user_new = User.new(:email=>"adi@gmail.com")
        user_new.should_not be_valid
        user_new.errors[:email].should eq(["has already been taken"])
      end

    end

    describe "Validating Username" do

      it "should catch invalid username" do
        [nil,"","$$adi"].each do |u|
          user_new = User.new(@valid_attribute.merge(:username => u))
          user_new.should_not be_valid
          user_new.errors[:username].should_not be_empty
        end
      end

      #it "check for unique username" do
      #  User.create(@valid_attribute)
      #  user_new = User.new(:username=>"aditya")
      #  user_new.should_not be_valid
      #  user_new.errors[:username].should eq(["has already been taken"])
      #end
      it {
        User.create(@valid_attribute)
        should validate_uniqueness_of(:username)
      }

    end

    describe "Validating Password" do

      it "should catch invalid password" do
        [nil,""].each do |p|
          user_new = User.new(@valid_attribute.merge(:password => p))
          user_new.should_not be_valid
          user_new.errors[:password].should_not be_empty
        end
      end

      it "check password length should be equal to greater than 6" do
        @user.password = "$%%a"
        @user.should_not be_valid
        @user.errors[:password].should eq(["length should be greater than or equal to 6"])
      end
    end

    describe "Register User" do
      it "should create new User with given valid attributes" do
        lambda {
          User.create(@valid_attribute)
        }.should change(User,:count).by(1)
      end
    end

    describe "Authentication" do
      it "should authenticate user with correct username and password" do
        @user = Factory(:user)
        user_auth = User.authenticate(@user.username, @user.password)
        user_auth.should eq(@user)
      end

      it "should not authenticate user with incorrect password" do
        @user = Factory(:user)
        user_auth = User.authenticate(@user.username, "invalid")
        user_auth.should be_nil
      end
    end

    describe "Association" do
      it { should have_and_belong_to_many(:roles) }
    end

  end
end
