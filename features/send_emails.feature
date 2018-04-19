Feature: Send emails based on account attributes
  As a member at Hamilton Central School,
  So that I can send emails to other members selected according to my criteria,
  I want to be able to send emails to a select subset of users

  Background: the website already has existing accounts
    Given these UserAccounts:
    | password  | email                | accounttype| name            | childname       | childgrade| homeaddress | confirmed_at |
    | halitjaha  | lhalitjaha@colgate.edu |  teacher   | Lumbardh Halitjaha  | Little T        | 4         | 13 Oak Dr   | DateTime.new(2018, 4, 19)|
    | jamila    | ajamil@colgate.edu   |  parent  | Asad Jamil    | Little Jimmy    | 10         | 10 Oak Dr   | DateTime.new(2018, 4, 19) |
    Given I am a new, signed-in user account

  Scenario: Send to all users
    Given I am on the user accounts page
    And I fill in "Subject" with "Test"
    And I fill in "Body" with "Is this working?"
    And I press "Send message to members shown"
    Then "ajamil@colgate.edu" should receive an email
    And "lhalitjaha@colgate.edu" should receive an email
    When I open the email
    Then I should see "Hello Lumbardh Halitjaha!" in the email body
    And I should be on the user accounts page

  Scenario: Send to 1 user
    Given I am on the user accounts page
    And I fill in "Name" with "as"
    And I press "Refine the list of members"
    And I fill in "Subject" with "Test"
    And I fill in "Body" with "Is this working?"
    And I press "Send message to members shown"
    Then "lhalitjaha@colgate.edu" should receive no email
    And "ajamil@colgate.edu" should receive an email
    And I should be on the user accounts page
    When I open the email
    Then I should see "Hello Asad Jamil!" in the email body
