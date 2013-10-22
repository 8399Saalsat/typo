Feature: Add and Edit Categories
  As a blog admin
  In order to organize articles on the blog
  I want to be able to create categories for the articles
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
  
  Scenario: The Link Works
    When I follow "Categories"
    Then I should see "Categories"
    And I should see "Keywords"
    And I should see "Permalink"
    And I should see "Categories"
  
  Scenario: Admin can add categories
    When I follow "Categories"
    And I fill in "Name" with "Test Category One"
    And I fill in "Keywords" with "Keytest"
    And I press "Save"
    Then I should see "Test Category One"
    And I should see "Keytest"
    
  Scenario: Admin can edit categories
    When I follow "Categories"
    Then I follow "General"
    Then I fill in "Description" with "Testing category edit"
    And I press "Save"
    Then I should see "Testing category edit"