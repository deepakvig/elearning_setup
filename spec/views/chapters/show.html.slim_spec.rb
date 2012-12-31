require 'spec_helper'

describe "chapters/show" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "Title",
      :description => "MyText"))
    @chapter = assign(:chapter, stub_model(Chapter,
      :title => "Title",
      :description => "MyText",
      :topic => @topic
    ))
  end

  it "renders attributes in <p>" do
    pending
    render
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
