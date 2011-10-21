require 'spec_helper'

describe SessionsController do

  describe "on POST to #create with good credentials and a request return url" do

    it "redirects to the landing path" do
      @user = Factory(:user)
      post :create, :username => @user.username, :password => @user.password
      assigns(:session => {:user_id => @user.id })
      response.should redirect_to(landing_path)
    end

  end

  describe "on DELETE to #destroy the current user session" do

    it "should redirect to index page after destroy" do
      @user = Factory(:user)
      delete :destroy
      response.should redirect_to(root_url)
    end

  end

end