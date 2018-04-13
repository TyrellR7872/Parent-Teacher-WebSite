Feature: Filter emails based on account attributes
  As a member at Hamilton Central School,
  So that I can create mailing lists based on common account attributes,
  I want to be able to filter emails by those attributes

  Background: the website already has existing accounts
    Given these UserAccounts:
    | username  | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | lumi   | halitjaha  | lhalitjaha@colgate.edu |  teacher   | Lumbardh Halitjaha  | Little T        | 4         | 13 Oak Dr   |
    | asood   | jamil    | ajamil@colgate.edu   |  parent  | Asad Jamil    | Little Jimmy    | 10         | 10 Oak Dr   |

  Scenario: Filter by account type
    Given I am on the members page
    And I fill in "Account type" with "teacher"
    And I press "Filter users"
    Then I should see "lhalitjaha@colgate.edu"
    And I should not see "ajamil@colgate.edu"

  Scenario: Filter by start grade only
    Given I am on the members page
    And I fill in "From grade" with "1"
    And I press "Filter users"
    Then I should see "lhalitjaha@colgate.edu"
    And I should see "ajamil@colgate.edu"

  Scenario: Filter by end grade only
    Given I am on the members page
    And I fill in "To grade" with "11"
    And I press "Filter users"
    Then I should see "lhalitjaha@colgate.edu"
    And I should see "ajamil@colgate.edu"

  Scenario: Filter by start and end grade for both users
    Given I am on the members page
    And I fill in "From grade" with "1"
    And I fill in "To grade" with "11"
    And I press "Filter users"
    Then I should see "lhalitjaha@colgate.edu"
    And I should see "ajamil@colgate.edu"

  Scenario: Filter by start and end grade for 1 user
    Given I am on the members page
    And I fill in "From grade" with "1"
    And I fill in "To grade" with "4"
    And I press "Filter users"
    Then I should see "lhalitjaha@colgate.edu"
    And I should not see "ajamil@colgate.edu"
