require 'spec_helper'

describe "chapters/index" do
  before(:each) do
    @topic = assign(:topic, 
      stub_model(Topic,
        :title => "Title",
        :description => "MyText"
      )
    )
    assign(:chapters, [
      stub_model(Chapter,
        :title => "Title",
        :description => "MyText",
        :topic => @topic
      ),
      stub_model(Chapter,
        :title => "Title",
        :description => "MyText",
        :topic => @topic
      )
    ])
  end

  it "renders a list of chapters" do
    pending
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
