require 'spec_helper'

describe "topics/show" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "MyTitle",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/MyText/)
    rendered.should match(/MyTitle/)
  end
end
