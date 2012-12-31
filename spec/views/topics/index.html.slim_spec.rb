require 'spec_helper'

describe "topics/index" do
  before(:each) do
    assign(:topics, [
      stub_model(Topic,
        :title => "MyTitle",
        :description => "MyText"
      ),
      stub_model(Topic,
        :title => "MyTitle",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of topics" do
    render
    rendered.should have_selector("tr > td", :content => "MyTitle".to_s, :count => 2)
    rendered.should have_selector("tr > td", :content => "MyText".to_s, :count => 2)
  end
end
