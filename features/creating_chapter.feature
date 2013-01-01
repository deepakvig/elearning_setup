Feature: Create a new Chapter
  In order to see new Chapter
  As a registered user
  I want to first create a new Chapter

  Scenario: Going to new Chapter page for creating new Chapter
    Given I am a new, authenticated user
    When I go to a particular topic
    And I follow "New Chapter"
    Then I should see "New chapter" 

  Scenario: Creating new Chapter
    Given I am a new, authenticated user
    And I go to a particular topic
    And I follow "New Chapter"
    And I fill in "chapter_title" with "Title"
    And I fill in "chapter_description" with "Description"
    And I press "Save"
    Then I should see "Chapter was successfully created"
    
