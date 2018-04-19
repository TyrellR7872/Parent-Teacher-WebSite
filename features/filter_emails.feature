Feature: Filter emails based on account attributes
  As a member at Hamilton Central School,
  So that I can create mailing lists based on common account attributes,
  I want to be able to filter emails by those attributes

  Background: the website already has existing accounts
    Given these UserAccounts:
    | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | halitjaha  | lhalitjaha@colgate.edu |  teacher   | Lumbardh Halitjaha  | Little T        | 4         | 13 Oak Dr   |
    | jamila    | ajamil@colgate.edu   |  parent  | Asad Jamil    | Little Jimmy    | 10         | 10 Oak Dr   |
    Given I am a new, signed-in user account

  Scenario: Redirect to login page if not signed in
    When I follow "Log Out"
    And I follow "User Accounts"
    Then I should be on the sign in page
    And I should see "Sign in to view user accounts"

  Scenario: Filter by account type
    Given I am on the user accounts page
    And I fill in "Account type" with "teacher"
    And I press "Refine the list of members"
    Then I should see "lhalitjaha@colgate.edu"
    And I should not see "ajamil@colgate.edu"

  Scenario: Filter by name
    Given I am on the user accounts page
    And I fill in "Name" with "as"
    And I press "Refine the list of members"
    Then I should not see "lhalitjaha@colgate.edu"
    And I should see "ajamil@colgate.edu"

  Scenario: Filter by start grade only
    Given I am on the user accounts page
    And I fill in "From grade" with "1"
    And I press "Refine the list of members"
    Then I should see "lhalitjaha@colgate.edu"
    And I should see "ajamil@colgate.edu"

  Scenario: Filter by end grade only
    Given I am on the user accounts page
    And I fill in "To grade" with "11"
    And I press "Refine the list of members"
    Then I should see "lhalitjaha@colgate.edu"
    And I should see "ajamil@colgate.edu"

  Scenario: Filter by start and end grade for both users
    Given I am on the user accounts page
    And I fill in "From grade" with "1"
    And I fill in "To grade" with "11"
    And I press "Refine the list of members"
    Then I should see "lhalitjaha@colgate.edu"
    And I should see "ajamil@colgate.edu"

  Scenario: Filter by start and end grade for 1 user
    Given I am on the user accounts page
    And I fill in "From grade" with "1"
    And I fill in "To grade" with "4"
    And I press "Refine the list of members"
    Then I should see "lhalitjaha@colgate.edu"
    And I should not see "ajamil@colgate.edu"
