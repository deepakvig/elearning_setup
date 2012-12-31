require 'spec_helper'

describe Chapter do

  it "is valid with valid params" do
    FactoryGirl.build(:chapter).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:chapter, :title => nil).should_not be_valid
  end

  it "is invalid without a description" do
    FactoryGirl.build(:chapter, :description => nil).should_not be_valid
  end

  it "is invalid without a topic" do
    FactoryGirl.build(:chapter, :topic => nil).should_not be_valid
  end

  it "saves record to the db" do
    expect {
      FactoryGirl.build(:chapter).save
    }.to change{ Chapter.count }.from(0).to(1)
  end

  it "update record to the db" do
    @chapter = FactoryGirl.build(:chapter)
    @chapter.save!
    expect {
      @chapter.update_attributes(:title => 'Rails')
    }.not_to change{ Chapter.count }
  end

  it "delete record to the db" do
    @chapter = FactoryGirl.build(:chapter)
    @chapter.save!
    expect {
      @chapter.destroy
    }.to change{ Chapter.count }.from(1).to(0)
  end

  

end
