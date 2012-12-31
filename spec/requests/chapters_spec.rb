require 'spec_helper'

describe "Chapters" do
  describe "GET /chapters" do
    it "works! (now write some real specs)" do
      @topic = FactoryGirl.create(:topic)
      get topic_chapters_path(@topic)
      response.status.should be(200)
    end
  end
end
