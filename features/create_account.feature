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
    Given I am on the new user account registration page
    When I fill in the following:
      |Name|Joel Sommers|
      | Email|jsommers@colgate.edu|
      | Password|cosc|
      |Password confirmation|cosc|

    When I press "Sign Up"
    Then I should be on the home page
    And I should see "Welcome! You have signed up successfully.
    When I follow "Hello, jsommers@colgate.edu"
    And I follow "Edit profile details"
    And I fill in the following:
      | Child's Name  |Annie        |
      | Child's Grade |4            |
      | Address  |14 Oak Dr     |

    And press "Update"
    Then I should be on the home page
    And when I follow "Hello, jsommers@colgate.edu"
    And I should see "Joel Sommers"
    And I should see "Annie"
    And I should see "4"
    And I should see "14 Oak Dr"

  Scenario: Create a new user account with unequal password
    Given I am on the new user account registration page
    When I fill in the following:
      |Full Name|Michael Hay|
      | Email|mhay@colgate.edu|
      | Password|cosc|
      |Confirm Password|cosc1|

    When I press "Sign Up"
    Then I should be on the new user account registration page
    Then I should see "Passwords are not equal"

  Scenario: Create a new user account with creation failed
    Given I am on the new user account registration page
    When I fill in the following:
      |Full Name|Michael Hay|
      | Email||
      | Password|cosc|
      |Confirm Password|cosc|

    When I press "Sign Up"
    Then I should be on the new user account page
    Then I should see "Email can't be blank"
