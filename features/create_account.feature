Feature: Create a Teacher, Staff, or Parent User Account with user submitted login credentials
  As a Teacher/Staff Member/Parent at Hamilton Central School,
  So that I can create and access a private account on the school's website,
  I want to create a Teacher, Staff, or Parent user account using a personal email and password.

  Background: the website has already has existing accounts
    Given these UserAccounts:
    | password  | email                | accounttype| name            | childname       | childgrade| homeaddress | remember_created_at |
    | roberts   | troberts@colgate.edu |  teacher   | Tyrell Roberts  | Little T        | 4         | 13 Oak Dr   | DateTime.beginning_of_day |
    | carter    | ycarter@colgat.edu   |  student   | Yesu Carter     | Little Jimmy    | 2         | 10 Oak Dr   | DateTime.beginning_of_day |

  Scenario: Create a new user account with success
    Given I am on the new user account registration page
    When I fill in the following:
      |Name|Joel Sommers|
      | Email|jsommers@colgate.edu|
      | Password|cosc123|
      |Password Confirmation|cosc123|

    And I press "Sign up"
    Then I should be on the root page
    And I should see "Welcome! You have signed up successfully."
    When I follow "Hello, Joel Sommers"
    And I follow "Edit Profile Details"
    And I should see "Edit User account"
    And I fill in the following:
      | Child's Name |Annie        |
      | Child's Grade |4            |
      | Home Address  |14 Oak Dr     |
      |Current Password|cosc123|

    And press "Update details"
    Then I should be on the root page
    When I follow "Hello, Joel Sommers"
    Then I should see "Joel Sommers"
    And I should see "Annie"
    And I should see "4"
    And I should see "14 Oak Dr"

  Scenario: Create a new user account with unequal password
    Given I am on the new user account registration page
    When I fill in the following:
      |Name|Michael Hay|
      | Email|mhay@colgate.edu|
      | Password|cosc|
      |Password Confirmation|cosc1|

    And I press "Sign up"
    Then I should be on the user account registration page
    Then I should see "Password confirmation doesn't match Password"

  Scenario: Create a new user account with creation failed
    Given I am on the new user account registration page
    When I fill in the following:
      |Name|Michael Hay|
      | Email||
      | Password|cosc|
      |Password Confirmation|cosc|

    When I press "Sign up"
    Then I should be on the user account registration page
    Then I should see "Email can't be blank"
