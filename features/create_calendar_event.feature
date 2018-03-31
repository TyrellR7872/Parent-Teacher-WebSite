Feature: Create a Calendar events
  As a Staff Member at PTO,
  I want to create an event with name, location, description and time,
  So that I can let everyone who goes to the website know that there is an event coming up

  Background: the website already has some existing calendar event
    Given these CalendarEvents:
      | title        | description               | date_day | date_month |date_year| time     | location                | type | contact_person        | is_approved |
      | football     | cozy and sunny            | 10       |  7         | 2018    | 16:00    | Lathrop, Hamilton, NY   | sport| hnguyenvu@colgate.edu | true        |
      | jazz concert | come and chill with music | 12       |  5         | 2018    | 20:00    | Ho, Hamilton, NY        | music| pdhawka@colgate.edu   | true        |

  Scenario: Create a new calendar event with a status of approved
    Given I am on the create calendar event page
    When I fill in the following:
      | title          | easter egg decoration            |
      | description    | have fun eating hardboiled eggs  |
      | date_day       | 15                               |
      | date_month     | 4                                |
      | date_year      | 2018                             |
      | time           | 17:00  |
      | location       |  Newell, Colgate University |
      | type           |  family |
      | contact_person |  hnguyenvu@colgate.edu |
      | is_approved    | true |


    When I press "Create Event"
    Then I should be on the calendar events page
    And I should see "New event 'easter egg decoration' created and added to the page"
    And I should see that "easter egg decoration" has a date of "2018/04/15"
    And I should see that "easter egg decoration" has a time of "17:00"


    Scenario: Create a new calendar event with a status of not yet approved
      Given I am on the create calendar event page
      When I fill in the following:
        | title          | church dinner                    |
        | description    | free dinner for hungry students  |
        | date_day       | 5                                |
        | date_month     | 5                                |
        | date_year      | 2018                             |
        | time           | 17:30  |
        | location       |  First Baptist Church |
        | type           |  family |
        | contact_person |  hnguyenvu@colgate.edu |
        | is_approved    | false |

      When I press "Create Event"
      Then I should be on the calendar events page
      And I should see "New event 'church dinner' created but not shown"
      And I should not see "free dinner for hungry students"
