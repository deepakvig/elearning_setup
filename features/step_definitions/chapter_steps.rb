When /^I go to a particular topic$/ do
  Topic.create(:title => 'Title', :description => 'Desc')
  visit '/topics'
  click_link "Start Tutorial" 
end


