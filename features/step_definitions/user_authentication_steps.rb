Given /^I am not authenticated$/ do
  visit('/users/sign_in') # ensure that at least
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password

  click_button "Sign in"
end

When /^I go to register$/ do
  visit '/users/sign_up'
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
  fill_in arg1, :with => arg2
end

When /^I press "(.*?)"$/ do |arg1|
  click_button arg1
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

When /^I go to login page$/ do
  visit '/users/sign_in' 
end

Given /^I have registered with "(.*?)" and "(.*?)"$/ do |arg1, arg2|
  User.new(:email => arg1, :password => arg2, :password_confirmation => arg2).save!
end

