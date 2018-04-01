Feature: Create a Calendar events
  As a Staff Member at PTO,
  I want to create an event with name, location, description and time,
  So that I can let everyone who goes to the website know that there is an event coming up

  Background: the website already has some existing calendar event
    Given these CalendarEvents:
      | title        | description               | start_date_day | start_date_month |start_date_year| start_time     | location                | is_sport | is_musical | contact_person        | is_approved |
      | football     | cozy and sunny            | 10             |  7               | 2018          | 16:00          | Lathrop, Hamilton, NY   | true     |            | hnguyenvu@colgate.edu | true        |
      | jazz concert | come and chill with music | 12             |  5               | 2018          | 20:00          |  Ho, Hamilton, NY       |          | true       | pdhawka@colgate.edu   | true        |

  Scenario: Create a new calendar event with a status of approved
    Given I am on the create calendar event page
    When I fill in the following:
      | title            | easter egg decoration            |
      | description      | have fun eating hardboiled eggs  |
      | start_date_day   | 15                               |
      | start_date_month | 4                                |
      | start_date_year  | 2018                             |
      | start_time       | 17:00  |
      | location         |  Newell, Colgate University |
      | for_family       |  true |
      | contact_person   |  hnguyenvu@colgate.edu |
      | is_approved      | true |


    When I press "Create Event"
    Then I should be on the calendar events page
    And I should see "New event 'easter egg decoration' created and added to the page"
    And I should see that "easter egg decoration" has a date of "2018/04/15"
    And I should see that "easter egg decoration" has a time of "17:00"


    Scenario: Create a new calendar event with a status of not yet approved
      Given I am on the create calendar event page
      When I fill in the following:
        | title            | church dinner                    |
        | description      | free dinner for hungry students  |
        | start_date_day   | 20                               |
        | start_date_month | 5                                |
        | start_date_year  | 2018                             |
        | start_time       | 17:00  |
        | location         |  First Baptist Church |
        | for_family       |  true |
        | contact_person   |  hnguyenvu@colgate.edu |
        | is_approved      | true |

      When I press "Create Event"
      Then I should be on the calendar events page
      And I should see "New event 'church dinner' created but not shown"
      And I should not see "free dinner for hungry students"
