When /^I go to topics page$/ do
  visit '/topics'
end

When /^I follow "(.*?)"$/ do |arg1|
  click_link arg1  
end

Given /^I go to new topics page$/ do
  visit new_topic_path  
end

