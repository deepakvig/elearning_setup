require 'spec_helper'

describe ChaptersController do
  include Devise::TestHelpers

  before do
    Topic.stub(:find).and_return(@topic = mock_model(Topic))
  end

  context "#index" do
    it "assigns all chapter as @chapters" do
      @topic.stub_chain(:chapters,:all).and_return([])
      get :index, { :topic_id => @topic.to_param}
      assigns(:chapters).should eql([])
      response.should render_template('index')
    end
  end

  context "#show" do
    it "finds a record and assigns chapter as @chapter" do
      @topic.stub_chain(:chapters, :find).and_return(@chapter = mock_model(Chapter))
      get :show, {:topic_id => @topic.to_param, :id => 1}
      assigns(:chapter).should eql(@chapter)
      response.should render_template('show')
    end
  end

  context "#new" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      @topic.stub_chain(:chapters, :build).and_return(mock_model(Chapter).as_new_record)
    end

    it "assigns a new chapter as @chapter" do
      get :new, { :topic_id => @topic.to_param}
      assigns(:chapter).should be_a_new(Chapter)
    end
  end

  context "#edit" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      @topic.stub_chain(:chapters, :find).and_return(@chapter = mock_model(Chapter))
    end

    it "assigns a new chapter as @chapter" do
      get :edit, {:topic_id => @topic.to_param, :id => 1 }
      assigns(:chapter).should be_an_instance_of(Chapter)
    end

    it "assigns the requested chapter as @chapter" do
      get :edit, {:topic_id => @topic.to_param, :id => @chapter.to_param}
      assigns(:chapter).should eq(@chapter)
    end

  end

  context "#create" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      @topic.stub_chain(:chapters, :build).and_return(@chapter = mock_model(Chapter))
    end
  
    it "creates a chapter and saves it and redirect to show path" do
      @chapter.stub!(:save).and_return(true)
      @chapter.should_receive(:save).and_return(true) 
      post :create, { :topic_id => @topic.to_param, :chapter => { :title => "First Chapter", :description => "Chapter Description"}}
      assigns(:chapter).should eql @chapter
      response.should redirect_to([@topic, @chapter])
      flash[:notice].should eql 'Chapter was successfully created.'
    end
  
    it "throws error on saving it and renders new template" do
      @chapter.stub!(:save).and_return(false)
      @chapter.should_receive(:save).and_return(false) 
      post :create, { :topic_id => @topic.to_param, :chapter => { :title => "First Chapter"}}
      assigns(:chapter).should eql @chapter
      response.should render_template('new')
    end
  end

  context "#update" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      @topic.stub_chain(:chapters, :find).and_return(@chapter = mock_model(Chapter))
    end

    it "assigns a newly created chapter as @chapter" do
      @chapter.should_receive(:update_attributes).and_return(true)
      put :update, {:topic_id => @topic.to_param, :id => @chapter.to_param, :chapter => { "description" => "MyText" } }
      assigns(:chapter).should be_a(Chapter)
      assigns(:chapter).should be_persisted
    end

    it "redirects to the created chapter" do
      @chapter.should_receive(:update_attributes).and_return(true)
      post :update, {:topic_id => @topic.to_param, :id => @chapter.to_param, :chapter => { "description" => "MyText" } }
      response.should redirect_to([@topic, @chapter])
    end

    it "assigns the chapter as @chapter" do
      @chapter.should_receive(:update_attributes).and_return(false)
      put :update, {:topic_id => @topic.to_param, :id => @chapter.to_param, :chapter => { "description" => "invalid value" }}
      assigns(:chapter).should eq(@chapter)
    end

    it "re-renders the 'edit' template" do
      @chapter.should_receive(:update_attributes).and_return(false)
      put :update, {:topic_id => @topic.to_param, :id => @chapter.to_param, :chapter => { "description" => "invalid value" }}
      response.should render_template("edit")
    end
  end

  context "#destroy" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      @topic.stub_chain(:chapters, :find).and_return(@chapter = mock_model(Chapter))
      @chapter.should_receive(:destroy)
    end

    it "destroys the requested chapter" do
      delete :destroy, {:topic_id => @topic.to_param, :id => @chapter.to_param}
    end

    it "redirects to the chapter list" do
      delete :destroy, {:topic_id => @topic.to_param, :id => @chapter.to_param}
      response.should redirect_to(topic_chapters_url(@topic))
    end
  end

end
