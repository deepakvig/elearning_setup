When /^I go to topics page$/ do
  visit '/topics'
end

When /^I follow "(.*?)"$/ do |arg1|
  click_link arg1  
end

Then /^I should be on new topic page$/ do
end
