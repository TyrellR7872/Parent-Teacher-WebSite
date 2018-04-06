Feature: Delete a calendar event
  As a member of PTO
  So that I can remove an event that's no longer relevant
  I want to delete the calendar event

  Background: the website already has some existing calendar event
    Given these CalendarEvents:
      | title        | description               | start_date_time           | end_date_time             | location                | is_sport | is_musical | contact_person        | is_approved |
      | football     | cozy and sunny            | 2018/03/02 12:00 PM       | 2018/05/02 12:00 PM       | Lathrop, Hamilton, NY   | true     |            | hnguyenvu@colgate.edu | true        |
      | jazz concert | come and chill with music | 2018/06/02 12:00 PM       | 2018/08/02 12:00 PM       | Ho, Hamilton, NY        |          | true       | pdhawka@colgate.edu   | true        |
      | game night   | play some games           | 2018/07/02 12:00 PM       | 2018/10/02 12:00 PM       | Ho, Hamilton, NY        |          | true       | ajamil@colgate.edu   | true        |

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
