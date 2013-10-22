Feature: Merge Articles
  As a blog administrator
  In order to reduce redundant articles
  I want to be able to merge articles together
  
  Background:
    Given the blog is set up
    And the following articles exist:
    | title 		| author		| body							    | published| allow_comments |
    | Article One	| Author John	| This is a very short article.  	| true     | true			|
    | Article Two  | Author Jeff	| This is another short article.  	| true     | true			|
    
    And the following users exist:
    | login       	  | password         | email                    | profile_id	 |  name      	 | state	|
    | reader          | reader_pw        | reader@test.org      	|    2     		 | Reader        | active	|
    | administrator   | administrator_pw | administrator@test.org   |    1           | Administrator | active	|
    
  Scenario: An admin can merge articles
    And I am logged into the admin panel
    And I visit the edit page for "Article One"
    Then I should see "Merge Articles"
    
  Scenario: Non-admins cannot merge articles
    Given I am logged into the admin panel as "reader"
    And I visit the edit page for "Article One"
    Then I should not see "Merge Articles"
    
  Scenario: Successfully merge articles
    And I am logged into the admin panel
    And I visit the edit page for "Article One"
    And I merge the article with "Article Two"
    Then I should see "This is a very short article.This is another short article."
  
  Scenario: Merged article has one author
    And I am logged into the admin panel
	And I merge "Article Two" with "Article One"
    Then the "Article Two" author should be "Jeff"
    

  Scenario: Merged article should have one title
    Given I am logged into the admin panel as "administrator"
    And I merge "Article One" with "Article Two"
 	And I am on the home page
 	Then I should see "Article One"
 	And I should not see "Article Two"
