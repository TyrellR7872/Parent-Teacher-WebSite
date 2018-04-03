Feature: Create a Calendar events
  As a Staff Member at PTO,
  I want to create an event with name, location, description and time,
  So that I can let everyone who goes to the website know that there is an event coming up

  Background: the website already has some existing calendar event
    Given these CalendarEvents:
      | title        | description               | start_date_time            | end_date_time              | location                | is_sport | is_musical | contact_person        | is_approved |
      | football     | cozy and sunny            | 3rd Feb 2021 04:05:06 PM   | 2nd Mar 2021 04:05:06 PM   | Lathrop, Hamilton, NY   | true     |            | hnguyenvu@colgate.edu | true        |
      | jazz concert | come and chill with music | 6th Feb 2020 04:05:06 PM   | 8th Feb 2021 04:05:06 PM   | Ho, Hamilton, NY        |          | true       | pdhawka@colgate.edu   | true        |

  Scenario: Create a new calendar event with a status of approved
    Given I am on the create calendar event page
    When I fill in the following:
      | title            | easter egg decoration            |
      | description      | have fun eating hardboiled eggs  |
      | start_date_time  | 3rd Jan 2021 04:05:06 AM         |
      | end_date_time    | 3rd Jan 2021 04:05:06 PM         |
      | location         |  Newell, Colgate University |
      | for_family       |  true |
      | contact_person   |  hnguyenvu@colgate.edu |
      | is_approved      | true |

    When I press "Create Event"
    Then I should be on the calendar events page
    And I should see "New event 'easter egg decoration' created and added to the page"
    And I should see that "easter egg decoration" has a date of "2021/01/03"
    And I should see that "easter egg decoration" has a time of "04:05"

  Scenario: Create a new calendar event with a status of not yet approved
    Given I am on the create calendar event page
    When I fill in the following:
      | title            | church dinner                    |
      | description      | free dinner for hungry students  |
      | start_date_time  | 3rd Sep 2001 05:05:00 PM         |
      | end_date_time    | 8th Oct 2001 07:05:06 PM         |
      | location         |  First Baptist Church |
      | for_family       |  true |
      | contact_person   |  hnguyenvu@colgate.edu |
      | is_approved      | false |

    When I press "Create Event"
    Then I should be on the calendar events page
    And I should see "New event 'church dinner' created but not shown"
    When I go to the calendar events page
    Then I should be on the calendar events page
    And I should not see "church dinner"
    And I should not see "free dinner for hungry students"
