Feature: Send emails based to volunteers of an event
  As an admin at Hamilton Central School,
  So that I can send messages to volunteers of specific events
  I want to be able to send emails to all volunteers of an event

  Background: the website already has existing accounts

    Given these CalendarEvents:
      | title        | description               | start_date_time           | end_date_time             | location                | is_sport | is_musical | contact_person        | is_approved |
      | football     | cozy and sunny            | 2018/03/02 12:00 PM       | 2018/05/02 12:00 PM       | Lathrop, Hamilton, NY   | true     |            | hnguyenvu@colgate.edu | true        |

    Given I am a new, signed-in user account with admin
    And I am on the calendar events page
    And I follow "Sign up for football"

  Scenario: Send email to volunteers
    Given I am on the calendar events page
    And I follow "football"
    And I follow "Show volunteers list"
    And I fill in "Subject" with "Test"
    And I fill in "Body" with "Is this working?"
    And I press "Send message to members shown"
    Then "testeruser@colgate.edu" should receive an email
    When I open the email
    Then I should see "Hello Test User!" in the email body
    And I should see "Is this working?" in the email body
