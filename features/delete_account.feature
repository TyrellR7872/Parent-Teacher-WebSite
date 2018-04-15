Feature: Delete a user account
  As a Teacher, Staff Member, Parent,
  So that I can remove my information from our PTO website,
  I want to be able to delete my user account on the website permanently.

  Background: the website has already has existing accounts
    Given these UserAccounts:
    | username  | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | tyrell    | roberts   | troberts@colgate.edu |  teacher   | Tyrell Roberts  | Little T        | 4         | 13 Oak Dr   |
    | ycarter   | carter    | ycarter@colgat.edu   |  student   | Yesu Carter     | Little Jimmy    | 2         | 10 Oak Dr   |

  Scenario: Delete a user account with success
