Feature: Delete a calendar event
  As a member of PTO
  So that I can remove an event that's no longer relevant
  I want to delete the calendar event

  Background: the website already has some existing calendar event
    Given these CalendarEvents:
      | title        | description               | start_date_time           | end_date_time             | location                | is_sport | is_musical | contact_person        | is_approved |
      | football     | cozy and sunny            | 02/03/2018 12:00 PM       | 02/05/2018 12:00 PM       | Lathrop, Hamilton, NY   | true     |            | hnguyenvu@colgate.edu | true        |
      | jazz concert | come and chill with music | 02/06/2018 12:00 PM       | 02/08/2018 12:00 PM       | Ho, Hamilton, NY        |          | true       | pdhawka@colgate.edu   | true        |
      | game night   | play some games           | 02/07/2018 12:00 PM       | 02/10/2018 12:00 PM       | Ho, Hamilton, NY        |          | true       | ajamil@colgate.edu   | true        |

  Scenario: Delete an event
    Given I am on the calendar events page
    When I follow "jazz concert"
    Then I should see "jazz concert"
    And I should see "come and chill with music"
    And I should not see "game night"
    When I follow "Delete event"
    Then I should be on the calendar events page
    And I should see "Event 'jazz concert' deleted"
    When I follow "HCS-PTO"
    Then I follow "Calendar Home"
    Then I should see "football"
    And I should see "game night"
    And I should not see "jazz concert"
    And I should not see "come and chill with music"
