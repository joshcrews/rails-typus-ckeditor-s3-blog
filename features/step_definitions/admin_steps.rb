When /^I log into the admin$/ do
  steps %Q{
    When I go to the path "/admin"

  	And I fill in "Email" with "admin@foalio.com"
  	And I press "Sign up"
  	When I follow "Dashboard"
  }
end
