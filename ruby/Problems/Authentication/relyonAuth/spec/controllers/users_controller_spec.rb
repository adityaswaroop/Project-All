require 'spec_helper'

describe UsersController do
  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end

  def valid_attributes
    {
        :name => "Aditya Swaroop",
        :email => "adi@gmail.com",
        :username => "aditya",
        :password => "aditya"
    }
  end

  def valid_attribute_role
    {
        :role_type => "Admin"
    }
  end

  describe "Create New User" do
    it "creates a new user" do
      expect {
        post :create, :user => valid_attributes
      }.to change(User, :count).by(1)
    end

    it "assigns a newly created user as @user" do
      post :create, :user => valid_attributes
      assigns(:user).should be_a(User)
      assigns(:user).should be_persisted
    end

    it "redirects to the landing page" do
      post :create, :user => valid_attributes
      response.should redirect_to(landing_path)
    end
  end

  describe "Assign User with roles" do
    before(:each) {
      @user = User.create! valid_attributes
      @role = Role.create! valid_attribute_role
    }

    it "assigns all users as @users and all roles as @roles" do
      get :roles_assign
      assigns(:users).should eq([@user])
      assigns(:roles).should eq([@role])
    end

    it "should find user with user_id" do
      get :roles_assign, :users => Array[:id => @user.id, :role => @role.id]
      assigns(:user).should == @user
      assigns(:role).should == @role
    end

    it "should create new user role" do
      expect {
        get :roles_assign, :users => Array[:id => @user.id, :role => @role.id]
      }.to change(@user.roles, :count).by(1)
    end

    it "redirects to the role assign page" do
      get :roles_assign, :users => Array[:id => @user.id, :role => @role.id]
      response.should redirect_to(users_roles_assign_path)
    end
  end



end
