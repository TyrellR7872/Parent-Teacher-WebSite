Feature: Create a User that has administrative privileges
  As an Administrator of the PTO Website,
  So that I can see user account information, but ensure that private information is not viewable by standard users,
  I want to be able to use an account with the only privilege to see private information from user accounts (e.g. Address, Child Name, Child Grade)

  Background: the website has already has existing accounts
    Given these UserAccounts:
    | password  | email                | accounttype| name            | childname       | childgrade| homeaddress | remember_created_at | admin|
    | roberts   | troberts@colgate.edu |  teacher   | Tyrell Roberts  | Little T        | 4         | 13 Oak Dr   | DateTime.beginning_of_day |true|
    | carter    | ycarter@colgate.edu   |  student   | Yesu Carter     | Little Jimmy    | 2         | 10 Oak Dr   | DateTime.beginning_of_day |false|

  Scenario: Sign in to a User account that is an admin
    Given I am on the root page
    When I follow "Sign In"
    Then I should see "Log in"
    When I fill in the following:
      |Email|troberts@colgate.edu|
      |Password|roberts|

    And I press "Log in"
    Then I should be on the root page
    And I should see "User Accounts"

  Scenario: Sign in to a User account that is not an admin
    Given I am on the root page
    When I follow "Sign In"
    Then I should see "Log in"
    When I fill in the following:
      |Email|ycarter@colgate.edu|
      |Password|carter|

    And I press "Log in"
    Then I should be on the root page
    And I should not see "User Accounts"

  Scenario: Delete an Account as admin
    Given I am a new, signed-in user account with admin
    Given I am on the root page
    When I follow "User Accounts"
    When I follow "Yesu Carter"
    Then I should see "Delete User Account"
    When I follow "Delete User Account"
    Then I should be on the root page
