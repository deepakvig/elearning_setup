FactoryGirl.define do
  factory :topic do
    title "First Topic"
    description "Topic Description"
  end
  
  factory :chapter do
    sequence(:title) {|n| "Chapter #{n}"}
    description "Chapter Description"
    association :topic
  end

  factory :category do
    sequence(:name) {|n| "Category #{n}"}
    association :topic
  end

  factory :user do
    email "deepakvig@gmail.com"
    password "abc123"
  end
end
