Feature: Create a Teacher, Staff, or Parent User Account with user submitted login credentials
  As a Teacher/Staff Member/Parent at Hamilton Central School,
  So that I can create and access a private account on the school's website,
  I want to create a Teacher, Staff, or Parent user account using a personal email and password.

  Background: the website has already has existing accounts
    Given these UserAccounts:
    | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | roberts   | troberts@colgate.edu |  teacher   | Tyrell Roberts  | Little T        | 4         | 13 Oak Dr   |
    | carter    | ycarter@colgat.edu   |  student   | Yesu Carter     | Little Jimmy    | 2         | 10 Oak Dr   |

  Scenario: Create a new user account with success
    Given I am on the new user account page
    When I fill in the following:
      |Full Name|Joel Sommers|
      | Password|cosc|
      |Confirm Password|cosc|
      | Email|jsommers@colgate.edu|

    When I press "Create User Account"
    Then I should be on the user accounts page
    And I should see "User Account for 'Joel Sommers'" Successfully Created
    And I should see "Joel Sommers"
    When I follow "Edit profile details"
    And I fill in the following:
      | Child's Name  |Annie        |
      | Child's Grade |4            |
      | Address  |14 Oak Dr     |

    And press "Update Profile"
    Then I should be on the user accounts page
    And I should see "Joel Sommers"
    And I should see "Annie"
    And I should see "4"
    And I should see "14 Oak Dr"

  Scenario: Create a new user account with unequal password
    Given I am on the new user account page
    When I fill in the following:
      |Full Name|Michael Hay|
      | Password|cosc|
      |Confirm Password|cosc1|
      | Email|mhay@colgate.edu|

    When I press "Create User Account"
    Then I should be on the new user account page
    Then I should see "Passwords are not equal"

  Scenario: Create a new user account with creation failed
    Given I am on the new user account page
    When I fill in the following:
      |Full Name|Michael Hay|
      | Password|cosc|
      |Confirm Password|cosc|
      | Email||
    When I press "Create User Account"
    Then I should be on the new user account page
    Then I should see "User Account 'Michael Hay' Creation Failed"
