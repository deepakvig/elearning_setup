require "spec_helper"

describe ChaptersController do
  describe "routing" do

    it "routes to #index" do
      get("/topics/1/chapters").should route_to("chapters#index", :topic_id => "1")
    end

    it "routes to #new" do
      get("/topics/1/chapters/new").should route_to("chapters#new", :topic_id => "1")
    end

    it "routes to #show" do
      get("/topics/1/chapters/1").should route_to("chapters#show", :id => "1", :topic_id => "1")
    end

    it "routes to #edit" do
      get("/topics/1/chapters/1/edit").should route_to("chapters#edit", :id => "1", :topic_id => "1")
    end

    it "routes to #create" do
      post("/topics/1/chapters").should route_to("chapters#create", :topic_id => "1")
    end

    it "routes to #update" do
      put("/topics/1/chapters/1").should route_to("chapters#update", :id => "1", :topic_id => "1")
    end

    it "routes to #destroy" do
      delete("/topics/1/chapters/1").should route_to("chapters#destroy", :id => "1", :topic_id => "1")
    end

  end
end
