Feature: Sign in and sign out of a user's account
  As A Parent or Teacher
  So that I can safely access my personal account
  I want to log in using my username and password or log out when I am signed in

  Background: the website has already has existing accounts
    Given these UserAccounts:
    |name    | password  | email  | childname       | childgrade| homeaddress |
    |Test User| testpass| testpass@email.com |Test child| 7| 13 Oak Drive|

  Scenario: Sign in to a user account
    Given I am on the root page
    When I follow "Sign In"
    Then I should see "Log in"
    When I fill in the following:
      |Email|testpass@email.com|
      |Password|testpass|

    And I press "Log in"
    Then I should be on the root page
    And I should see "Hello, Test User"


  Scenario: Sign in to user account that doesn't exist
    Given I am on the root page
    When I follow "Sign In"
    And I fill in the following:
      |Email|badtestpass@email.com|
      |Password|testpass|

    And I press "Log in"
    Then I should be on the user account session page
    And I should see "Invalid Email or password."


  Scenario: Sign out of a signed in user account
    Given I am a new, signed-in user account
    Then I should see "Hello, Test User"
    When I follow "Log Out"
    Then I should be on the root page
    And I should not see "Hello, Test User"
    And I should see "Sign Up"
