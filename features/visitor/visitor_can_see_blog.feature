
Feature: Visitor can see blog
  In order to get notified
  As a visitor
  I want to read blog

Scenario: normal
	Given a post exists with title: "Article 1", body: "Woke up today"

  When I go to the homepage
  Then I should see "Article 1" within "#posts"
	And I should see "Woke up today"

	When I follow "Blog"
	Then I should see "Article 1"
	And I should see "Woke up today"
	And "Blog" should be the selected menu item
	
	When I follow "Article 1"
	Then I should see "Article 1" as the title
	And I should see "Woke up today"
	And "Blog" should be the selected menu item
	
Scenario: pagination
	Given a post exists with title: "Article 101"
	Given a post exists with title: "Article 102"
	Given a post exists with title: "Article 103"
	Given a post exists with title: "Article 104"
	Given a post exists with title: "Article 105"
	Given a post exists with title: "Article 106"
	Given a post exists with title: "Article 107"
	Given a post exists with title: "Article 108"
	Given a post exists with title: "Article 109"
	Given a post exists with title: "Article 110"
	Given a post exists with title: "Article 111"
	
	When I go to the path "/blog"
	Then I should see "Article 111"
	And I should not see "Artist 101"
	
	When I follow "Next"
	
	Then I should see "Article 101"
	And I should not see "Artist 111"

Scenario: archives
	Given a post exists from "2011-05-01" with title: "May 11"
	Given a post exists from "2011-05-01" with title: "May 11"
	Given a post exists from "2010-04-01" with title: "April 10"
	Given a post exists from "2009-03-01" with title: "March 09"
	
	When I go to the path "/blog"
	Then I should see "May 2011 (2)"
	Then I should see "April 2010 (1)"
	
	When I follow "May 2011 (2)"
	Then I should see "May 11"
	And I should not see "April 10"
