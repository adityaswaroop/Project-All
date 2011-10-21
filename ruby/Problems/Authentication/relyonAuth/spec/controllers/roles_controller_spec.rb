require 'spec_helper'

describe RolesController do
  describe "GET new" do
    it "assigns a new role as @role" do
      get :new
      assigns(:role).should be_a_new(Role)
    end
  end

  def valid_attributes
    {
        :role_type => "Admin"
    }
  end

  describe "Create New Role" do
    it "creates a new role" do
      expect {
        post :create, :role => valid_attributes
      }.to change(Role, :count).by(1)
    end

    it "assigns a newly created role as @role" do
      post :create, :role => valid_attributes
      assigns(:role).should be_a(Role)
      assigns(:role).should be_persisted
    end

    it "redirects to created Role" do
      post :create, :role => valid_attributes
      response.should redirect_to roles_path
    end
  end

  describe "GET index" do
    it "assigns all roles as @roles" do
      role = Role.create! valid_attributes
      get :index
      assigns(:roles).should eq([role])
    end
  end

  describe "GET show" do
    it "assigns the requested role as @role" do
      role = Role.create! valid_attributes
      get :show, :id => role.id.to_s
      assigns(:role).should eq(role)
    end
  end

  describe "GET edit" do
    it "assigns the requested role as @role" do
      role = Role.create! valid_attributes
      get :edit, :id => role.id.to_s
      assigns(:role).should eq(role)
    end
  end

  describe "Update Role" do
    it "updates the requested role" do
      role = Role.create! valid_attributes
      Role.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => role.id, :role => {'these' => 'params'}
    end

    it "assigns the requested role as @role" do
      role = Role.create! valid_attributes
      put :update, :id => role.id, :role => valid_attributes
      assigns(:role).should eq(role)
    end

    it "redirects to the roles" do
      role = Role.create! valid_attributes
      put :update, :id => role.id, :role => valid_attributes
      response.should redirect_to roles_path
    end
  end
end