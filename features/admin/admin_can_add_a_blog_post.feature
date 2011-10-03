
Feature: Admin can add a blog post
  In order to blog and be cool
  As a admin
  I want to write a blog post

Scenario: normal
  When I log into the admin
  When I follow "Post"
  And I follow "Add"
  When I fill in "Title" with "Article 1"
  And I fill in "Body" with "More info about this article"

  And I press "Save"

  Then I should see "success"

  When I go to the homepage
  Then I should see "Article 1" within "#posts"

	When I follow "Blog"
	Then I should see "Article 1" within "#posts"

Scenario: edit
	Given a post exists with title: "Article 1"
  When I log into the admin
  When I follow "Post"
  And I follow "Edit"
  When I fill in "Title" with "Article 3"

  And I press "Save"

  Then I should see "success"

  When I go to the homepage
  Then I should see "Article 3" within "#posts"
