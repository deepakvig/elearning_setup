require 'spec_helper'

describe TopicsController do
  include Devise::TestHelpers

  context "#index" do
    it "assigns all topics as @topics" do
      Topic.should_receive(:all).and_return([])
      get :index
      assigns(:topics).should eql([])
      response.should render_template('index')
    end
  end

  context "#show" do
    it "finds a record and assigns topic as @topic" do
      Topic.should_receive(:find).with("1").and_return(@topic = mock_model(Topic))
      get :show, {:id => 1}
      assigns(:topic).should eql(@topic)
      response.should render_template('show')
    end

    it "throws RecordNotFound when record is not present" do
      Topic.should_receive(:find).and_raise(ActiveRecord::RecordNotFound)
      get :show, {:id => 1}
      response.should redirect_to('/404.html')
    end
  end

  context "#new" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      Topic.stub!(:new).and_return(mock_model(Topic).as_new_record)
    end

    it "assigns a new topic as @topic" do
      get :new
      assigns(:topic).should be_a_new(Topic)
    end
  end

  context "#edit" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      Topic.should_receive(:find).and_return(@topic = mock_model(Topic))
    end

    it "assigns a new topic as @topic" do
      get :edit, { :id => 1 }
      assigns(:topic).should be_an_instance_of(Topic)
    end

    it "assigns the requested topic as @topic" do
      get :edit, {:id => @topic.to_param}
      assigns(:topic).should eq(@topic)
    end

  end

  context "#create" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      Topic.stub!(:new).and_return(@topic = mock_model(Topic))
    end
  
    it "creates a topic and saves it and redirect to show path" do
      Topic.should_receive(:new).with(
        "title" => "First Topic", "description" => "Topic Description").and_return(@topic)
      @topic.stub!(:save).and_return(true)
      @topic.should_receive(:save).and_return(true) 
      post :create, :topic => { :title => "First Topic", :description => "Topic Description"}
      assigns(:topic).should eql @topic
      response.should redirect_to(topic_url(@topic))
      flash[:notice].should eql 'Topic was successfully created.'
    end
  
    it "throws error on saving it and renders new template" do
      Topic.should_receive(:new).with(
        "title" => "First Topic").and_return(@topic)
      @topic.stub!(:save).and_return(false)
      @topic.should_receive(:save).and_return(false) 
      post :create, :topic => { :title => "First Topic"}
      assigns(:topic).should eql @topic
      response.should render_template('new')
    end
  end

  context "#update" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      Topic.should_receive(:find).and_return(@topic = mock_model(Topic))
    end

    it "assigns a newly created topic as @topic" do
      @topic.should_receive(:update_attributes).and_return(true)
      put :update, { :id => @topic.to_param, :topic => { "description" => "MyText" } }
      assigns(:topic).should be_a(Topic)
      assigns(:topic).should be_persisted
    end

    it "redirects to the created topic" do
      @topic.should_receive(:update_attributes).and_return(true)
      post :update, { :id => @topic.to_param, :topic => { "description" => "MyText" } }
      response.should redirect_to(@topic)
    end

    it "assigns the topic as @topic" do
      @topic.should_receive(:update_attributes).and_return(false)
      put :update, {:id => @topic.to_param, :topic => { "description" => "invalid value" }}
      assigns(:topic).should eq(@topic)
    end

    it "re-renders the 'edit' template" do
      @topic.should_receive(:update_attributes).and_return(false)
      put :update, {:id => @topic.to_param, :topic => { "description" => "invalid value" }}
      response.should render_template("edit")
    end
  end

  context "#destroy" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      Topic.stub(:find).and_return(@topic = mock_model(Topic))
      @topic.stub(:destroy)
    end

    it "destroys the requested topic" do
      delete :destroy, {:id => @topic.to_param}
    end

    it "redirects to the topics list" do
      delete :destroy, {:id => @topic.to_param}
      response.should redirect_to(topics_url)
    end

    it "doesn't destroy the topic if user is not logged in" do
      sign_out @user
      delete :destroy, {:id => @topic.to_param}
      response.should redirect_to(new_user_session_url)
    end
  end

end
