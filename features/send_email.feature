Feature: Send emails based on account attributes
  As a member at Hamilton Central School,
  So that I can send emails to other members selected according to my criteria,
  I want to be able to send emails to a select subset of users

  Background: the website already has existing accounts
    Given these UserAccounts:
    | username  | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | lumii   | halitjaha  | lhalitjaha@colgate.edu |  teacher   | Lumbardh Halitjaha  | Little T        | 4         | 13 Oak Dr   |
    | asood   | jamil    | ajamil@colgate.edu   |  parent  | Asad Jamil    | Little Jimmy    | 10         | 10 Oak Dr   |

  Scenario: Send to all users
    Given I am on the members page
    And I fill in "Your name" with "Priya"
    And I fill in "Subject" with "Test"
    And I fill in "Body" with "Is this working?"
    And I press "Send message to members shown"
    Then "ajamil@colgate.edu" should receive an email
    And "lhalitjaha@colgate.edu" should receive an email
    When I open the email
    Then I should see "Is this working?" in the email body
    And I should be on the members page

    Scenario: Send to 1 user
      Given I am on the members page
      And I fill in "Name" with "as"
      And I press "Refine the list of members"
      And I fill in "Your name" with "Priya"
      And I fill in "Subject" with "Test"
      And I fill in "Body" with "Is this working?"
      And I press "Send message to members shown"
      Then "lhalitjaha@colgate.edu" should receive no email
      And "ajamil@colgate.edu" should receive an email
      And I should be on the members page

      When I open the email
      Then I should see "Is this working?" in the email body
