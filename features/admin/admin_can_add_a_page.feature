
Feature: Admin can add a page
  In order to not have to update pages by hand in html
  As a admin
  I want to write a page

Scenario: normal
  When I log into the admin
  When I follow "Page"
  And I follow "Add"
  When I fill in "Title" with "About"
  And I fill in "Body" with "We are from Kansas"

  And I press "Save"

  Then I should see "success"

 	When I go to the path "/about"
  Then I should see "About"
	And I should see "We are from Kansas"

Scenario: edit
	Given a page exists with title: "About"
  When I log into the admin
  When I follow "Page"
  And I follow "Edit"
  When I fill in "Title" with "Aboot"

  And I press "Save"

  Then I should see "success"

  When I go to the path "/aboot"
	Then I should see "Aboot"
