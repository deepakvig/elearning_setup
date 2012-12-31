Feature: Create a new Topic
  In order to see new Topic
  As a registered user
  I want to first create a new Topic

  Scenario: Creating a new Topic 
    Given I am a new, authenticated user
    When I go to topics page
    And I follow "New Topic"
    Then I should be on new topic page  

