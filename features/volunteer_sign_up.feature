Feature: Sign-up to volunteer for an event
As a Parent or Teacher,
So that I can volunteer for HCS events,
I want to access a Volunteer Sign Up form from the description of the calendar event.

  Background: the website already has some existing calendar events
    Given these CalendarEvents:
      | title        | description               | start_date_time           | end_date_time             | location                | is_sport | is_musical | contact_person        | is_approved |
      | football     | cozy and sunny            | 2018/03/02 12:00 PM       | 2018/05/02 12:00 PM       | Lathrop, Hamilton, NY   | true     |            | hnguyenvu@colgate.edu | true        |
      | jazz concert | come and chill with music | 2018/06/02 12:00 PM       | 2018/08/02 12:00 PM       | Ho, Hamilton, NY        |          | true       | pdhawka@colgate.edu   | true        |
      | game night   | play some games           | 2018/07/02 12:00 PM       | 2018/10/02 12:00 PM       | Ho, Hamilton, NY        |          | true       | ajamil@colgate.edu   | true        |

  Scenario: Successfully signed up for an event
    Given I am a new, signed-in user account
    And I am on the calendar events page
    When I follow "Sign up for football"
    Then I should be on the football page
    And I should see "football"
    And I should not see "jazz concert"
    And I should see "You have signed up to volunteer for 'football'. Event will take place on 2018-03-02 12:00:00 UTC."

  Scenario: Failed to signed up for an event
    Given I am on the calendar events page
    When I follow "Sign up for football"
    Then I should be on the football page
    And I should see "You need to sign in to volunteer"
