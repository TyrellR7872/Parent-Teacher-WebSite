Feature: Update a calendar event
  As a member of PTO
  So that I can change the information of an event to reflect the true event
  I want to update an event

  Background: the website already has some existing calendar event
    Given these CalendarEvents:
      | title        | description               | start_date_time           | end_date_time             | location                | is_sport | is_musical | contact_person        | is_approved |
      | football     | cozy and sunny            | 02/03/2018 12:00 PM       | 02/05/2018 12:00 PM       | Lathrop, Hamilton, NY   | true     |            | hnguyenvu@colgate.edu | true        |
      | jazz concert | come and chill with music | 02/06/2018 12:00 PM       | 02/08/2018 12:00 PM       | Ho, Hamilton, NY        |          | true       | pdhawka@colgate.edu   | true        |
      | game night   | play some games           | 02/07/2018 12:00 PM       | 02/10/2018 12:00 PM       | Ho, Hamilton, NY        |          | true       | ajamil@colgate.edu   | true        |

  Scenario: Update an existing event
    Given I am on the calendar events page
    When I follow "jazz concert"
    Then I should see "jazz concert"
    And I should see "come and chill with music"
    And I should not see "game night"
    When I follow "Edit event details"
    And I fill in "Description" with "Tony Bennett is sick, we'll have Lady Gaga instead."
    And I fill in "Location" with "Dana Arts"
    And I fill in "Start date of the event" with "02/07/2018 10:00 PM"
    And I press "Update event details"
    Then I should see "Event 'jazz concert' updated"
    And I should see "jazz concert"
    And I should see "Tony Bennett is sick, we'll have Lady Gaga instead."
    And I should see "Dana Arts"
    And I should not see "Ho, Hamilton, NY"
    And I should see "02 Jul 22:00"
    When I follow "Back to event list"
    And I should see that "jazz concert" has a datetime of "2018/02/07 10:00 PM"
