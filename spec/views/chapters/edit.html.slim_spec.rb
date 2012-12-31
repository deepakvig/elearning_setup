require 'spec_helper'

describe "chapters/edit" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "MyString",
      :description => "MyText"
    ))
    @chapter = assign(:chapter, stub_model(Chapter,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit chapter form" do
    pending
    render
    rendered.should have_selector("form", :action => topic_chapter_path([@topic, @chapter]), :method => "post") do |form|
      form.should have_selector "input#chapter_title", :name => "chapter[title]"
      form.should have_selector "textarea#chapter_description", :name => "chapter[description]"
    end
  end
end
