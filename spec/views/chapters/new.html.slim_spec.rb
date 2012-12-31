require 'spec_helper'

describe "chapters/new.html.slim" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "MyString",
      :description => "MyText"))
    @chapter = assign(:chapter, stub_model(Chapter,
      :title => "MyString",
      :description => "MyText",
      :topic => @topic
    ).as_new_record)
  end

  it "renders new chapter form" do
    pending
    render 
    rendered.should have_selector "form", :action => topic_chapters_path, :method => "post" do |form|
      form.should have_selector "input#chapter_title", :name => "chapter[title]"
      form.should have_selector "textarea#chapter_description", :name => "chapter[description]"
    end
  end
end
