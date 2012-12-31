require 'spec_helper'

describe Topic do

  it "is valid with valid params" do
    FactoryGirl.build(:topic).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:topic, :title => nil).should_not be_valid
  end

  it "is invalid without a description" do
    FactoryGirl.build(:topic, :description => nil).should_not be_valid
  end

  it "is invalid without a description" do
    FactoryGirl.build(:topic, :description => nil).should_not be_valid
  end

  it "saves record to the db" do
    expect {
      FactoryGirl.build(:topic).save
    }.to change{ Topic.count }.from(0).to(1)
  end

  it "update record to the db" do
    @topic = FactoryGirl.build(:topic)
    @topic.save!
    expect {
      @topic.update_attributes(:title => 'Rails')
    }.not_to change{ Topic.count }
  end

  it "delete record to the db" do
    @topic = FactoryGirl.build(:topic)
    @topic.save!
    expect {
      @topic.destroy
    }.to change{ Topic.count }.from(1).to(0)
  end

  

end
