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
    
#    And the following comments exist:    
#    | author              	 | body             | article       | 
#    | reader				 | "Comment 1"	    | "Article Two" | 
#    | administrator			 | "Comment 2"		| "Article Two" |
#    | reader				 | "Comment 3"		| "Article Two" | 
#    | administrator			 | "Comment 4"		| "Article Two" | 
#    | reader				 | "Comment 5"		| "Article Two" |
#    And the following comments exist:
#    | id  | type    | author              | body                | article_id  | published_at        |
#    | 1   | Comment | blog_publisher_john | Hi Random Comment 1 | 1           | 2012-10-05 05:10:05 |
#    | 2   | Comment | contributor_mary    | Hi Random Comment 2 | 2           | 2012-10-05 05:10:05 |

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
  #  And I visit the edit page for "New Article"
    Then I should see "This is a very short article.This is another short article."
  
  Scenario: Merged article has one author
    And I am logged into the admin panel
	And I merge "Article Two" with "Article One"
 #   And I am on the home page
 #   Then I should not see "John"
 #   And I should see "Jeff"
    Then the "Article Two" author should be "Jeff"
    
#  Scenario: Merged article should have the comments from both the originals
#    Given I am logged into the admin panel as "administrator"
#    Then I should see ""
#    When I follow "Flying Parakeets"
#    Then I should see "comment body 1"
#    And I should see "comment body 2"

  Scenario: Merged article should have one title
    Given I am logged into the admin panel as "administrator"
    And I merge "Article One" with "Article Two"
 	And I am on the home page
 	Then I should see "Article One"
 	And I should not see "Article Two"
   
    
    
      # Scenario: Merged article should contain comments of both articles
  #   Given that the first article contains comments with id: 1, 2
  #   And the second article contains comments with id: 3, 4, 5
  #   And the articles are merged
  #   Then the merged articles should contain comments with id: 1, 2, 3, 4, 5

##  Scenario: Merged article should have title of either article
##    Given that the first article has title "First Article"
##    Given that the second article has title "Second Article"
##    And the articles are merged
##    Then the merged article should have the title "First Article" or "Second Article"
##
##  Scenario: Merged article should have author of either article
##    Given that the first article has author "First Author"
##    Given that the second article has author "Author Second"
##    And the articles are merged
##    Then the merged article should have the title "First Author" or "Author Second"
##
##
