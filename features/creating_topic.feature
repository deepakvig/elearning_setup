Feature: Create a new Topic
  In order to see new Topic
  As a registered user
  I want to first create a new Topic

  Scenario: Going to new Topic page for creating new Topic
    Given I am a new, authenticated user
    When I go to topics page
    And I follow "New Topic"
    Then I should see "New topic" 

  Scenario: Creating new Topic
    Given I am a new, authenticated user
    And I go to new topics page
    And I fill in "topic_title" with "Title"
    And I fill in "topic_description" with "Description"
    And I press "Save"
    Then I should see "Topic was successfully created"
    
