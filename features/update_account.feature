Feature: Update a user account
  As a member of PTO
  So that I can change the information of my account
  I want to update my account information

  Background: the website has already has existing accounts
    Given these UserAccounts:
    | name  | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | ty_rell   | roberts   | troberts@colgate.edu |  teacher   | Tyrell Roberts  | Little T        | 4         | 13 Oak Dr   |
    | ycarter   | carter    | ycarter@colgat.edu   |  student   | Yesu Carter     | Little Jimmy    | 2         | 10 Oak Dr   |

  Scenario: Update an existing user account
  Given I am on the new user account registration page
  When I fill in the following:
    | Name|Joel Sommers|
    | Email|jsommers@colgate.edu|
    | Password|cosc_is_cool|
    | Password confirmation|cosc_is_cool|

  When I press "Sign up"
  Then I should see "Welcome! You have signed up successfully."
  When I follow "Hello, Joel Sommers"
  Then I should see "Account details for Joel Sommers"
  When I follow "Edit profile details"
  And I fill in the following:
    | Childname  |Puppy                |
    | Childgrade |3                    |
    | Homeaddress  |Good Boy Drive, Yorkshire |
    | Current password|cosc_is_cool|

  And press "Update details"
  Then I should see "Your account has been updated successfully."
  When I follow "Hello, Joel Sommers"
  Then I should see "Joel Sommers"
  And I should see "Puppy"
  And I should see "3"
  And I should see "Good Boy Drive, Yorkshire"

  Scenario: Fail to update an existing user account
  Given I am on the new user account registration page
  When I fill in the following:
    | Name|Joel Sommers|
    | Email|jsommers@colgate.edu|
    | Password|cosc_is_cool|
    | Password confirmation|cosc_is_cool|

  When I press "Sign up"
  Then I should see "Welcome! You have signed up successfully."
  When I follow "Hello, Joel Sommers"
  Then I should see "Account details for Joel Sommers"
  When I follow "Edit profile details"
  And I fill in the following:
    | Email|                              |
    | Childname  |Puppy                |
    | Childgrade |3                    |
    | Homeaddress  |Good Boy Drive, Yorkshire |
    | Current password|cosc_is_lame|
  And I press "Update details"
  Then I should see "Email can't be blank"
  And I should see "Email is invalid"
  And I should see "Current password is invalid"
