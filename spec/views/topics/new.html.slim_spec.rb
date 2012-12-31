require 'spec_helper'

describe "topics/new" do
  before(:each) do
    assign(:topic, stub_model(Topic,
      :title => "MyText",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new topic form" do
    render
    rendered.should have_selector("form", 
      :action => topics_path, 
      :method => "post") do |form|
      form.should have_selector("input#topic_title", :name => "topic[title]")
      form.should have_selector("textarea#topic_description", :name => "topic[description]")
      form.should have_selector("input", :type => "submit", :name => "commit")
    end
  end
end
