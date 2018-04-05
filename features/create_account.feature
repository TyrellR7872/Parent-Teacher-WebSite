Feature: Create a Teacher, Staff, or Parent User Account with user submitted login credentials
  As a Teacher/Staff Member/Parent at Hamilton Central School,
  So that I can create and access a private account on the school's website,
  I want to create a Teacher, Staff, or Parent user account using a personal email and password.

  Background: the website has already has existing accounts
    Given these UserAccounts:
    | username  | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | ty_rell   | roberts   | troberts@colgate.edu |  teacher   | Tyrell Roberts  | Little T        | 4         | 13 Oak Dr   |
    | ycarter   | carter    | ycarter@colgat.edu   |  student   | Yesu Carter     | Little Jimmy    | 2         | 10 Oak Dr   |

  Scenario: Create a new user account
    Given I am on the new user account page
    When I fill in the following:
      | Username|JSomm|
      | Password|cosc|
      | Email|jsommers@colgate.edu|

    When I press "Create User Account"
    Then I should be on the user accounts page
    And I should see "User Account "JSomm"" Successfully Created
    And I should see that "JSomm" has Password of "cosc"
    When I fill in the following:
      | Type          |Teacher      |
      | Name          |Joel Sommers |
      | Child's Name  |Annie        |
      | Child's Grade |4            |
      | Home Address  |14 Oak Dr     |

    And press "Update User Account Details"
    Then I should be on the show user account page
    And I should see "Teacher"
    And I should see "Joel Sommers"
    And I should see "Annie"
    And I should see "4"
    And I should see "14 Oak Dr"
