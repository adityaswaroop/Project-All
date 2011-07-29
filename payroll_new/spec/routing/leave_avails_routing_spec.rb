require "spec_helper"

describe LeaveAvailsController do
  describe "routing" do

    it "routes to #index" do
      get("/leave_avails").should route_to("leave_avails#index")
    end

    it "routes to #new" do
      get("/leave_avails/new").should route_to("leave_avails#new")
    end

    it "routes to #show" do
      get("/leave_avails/1").should route_to("leave_avails#show", :id => "1")
    end

    it "routes to #edit" do
      get("/leave_avails/1/edit").should route_to("leave_avails#edit", :id => "1")
    end

    it "routes to #create" do
      post("/leave_avails").should route_to("leave_avails#create")
    end

    it "routes to #update" do
      put("/leave_avails/1").should route_to("leave_avails#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/leave_avails/1").should route_to("leave_avails#destroy", :id => "1")
    end

  end
end
