Feature: Delete a user account
  As a Teacher or Staff Member or Parent,
  So that I can remove my information from our PTO website,
  I want to be able to delete my user account on the website permanently.

  Background: A user is currently logged in
    Given I am on the new user account registration page
    When I fill in the following:
      | Name                | Joel Sommers        |
      | Email               | jsommers@colgate.edu|
      | Password            |  cosc123            |
      |Password confirmation|  cosc123            |
    And I press "Sign up"
    Then I should be on the root page

  Scenario: Delete a user account with confirmation
    Given I am on the root page
    When I follow "Hello, Joel Sommers"
    Then I should see "Account details for Joel Sommers"
    When I follow "Edit profile details"
    And I press "Delete User Account"
    Then I should be on the root page
    And I should see "User Account Successfully Deleted"
    And I should not see "Hello, Joel Sommers"
