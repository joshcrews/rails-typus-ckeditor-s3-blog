
Feature: Visitor can see about page
  In order to tell people that we are cool
  As a visitor
  I want to read the about page

Scenario: normal
	Given a page exists with title: "About", body: "We are from Kansas"

  When I go to the homepage
	When I follow "About"
	
	Then I should see "We are from Kansas"
	And "About" should be the selected menu item

Scenario: page not found
  When I go to the homepage
	When I follow "About"
	
	Then I should see "404"
	