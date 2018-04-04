Feature: Filter calendar events by date
  As a member of PTO
  So that I can see events between two dates
  I want to filter the list of calendar events by start and end date

  Background: the website already has some existing calendar event
    Given these CalendarEvents:
      | title        | description               | start_date_time           | end_date_time             | location                | is_sport | is_musical | contact_person        | is_approved |
      | football     | cozy and sunny            | 02/03/2018 12:00 PM       | 02/05/2018 12:00 PM       | Lathrop, Hamilton, NY   | true     |            | hnguyenvu@colgate.edu | true        |
      | jazz concert | come and chill with music | 02/06/2018 12:00 PM       | 02/08/2018 12:00 PM       | Ho, Hamilton, NY        |          | true       | pdhawka@colgate.edu   | true        |
      | game night   | play some games           | 02/07/2018 12:00 PM       | 02/10/2018 12:00 PM       | Ho, Hamilton, NY        |          | true       | ajamil@colgate.edu   | true        |

  Scenario: Filter with given start date and empty end date
    Given I am on the calendar events page
    And I fill in "From" with "02/06/2018 12:00 PM"
    And I press "Show events"
    Then I should see "jazz concert"
    And I should see "game night"
    And I should not see "football"

  Scenario: Filter with empty start and end dates
    Given I am on the calendar events page
    When I press "Show events"
    Then I should see "football"
    And I should see "jazz concert"
    And I should see "game night"

  Scenario: Filter with empty start date and given end date
    Given I am on the calendar events page
    And I fill in "To" with "02/05/2018 12:00 PM"
    And I press "Show events"
    Then I should see "football"
    And I should not see "jazz concert"
    And I should not see "game night"

  Scenario: Filter with given start and end dates
    Given I am on the calendar events page
    And I fill in "From" with "02/05/2018 12:00 PM"
    And I fill in "To" with "02/09/2018 12:00 PM"
    And I press "Show events"
    Then I should see "jazz concert"
    And I should not see "football"
    And I should not see "game night"
