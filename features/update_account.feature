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
  And I should see "Account details for Joel Sommers"
  When I follow "Edit profile details"
  And I fill in the following:
    | Child's Name  |Puppy                |
    | Child's Grade |3                    |
    | Address  |Good Boy Drive, Yorkshire |

  And press "Update Profile"
  Then I should see "Account details for Joel Sommers"
  And I should see "Profile 'JSomm' updated"
  And I should see "Joel Sommers"
  And I should see "Puppy"
  And I should see "3"
  And I should see "Good Boy Drive, Yorkshire"

  Scenario: Fail to update an existing user account
  Given I am on the new user account page
  When I fill in the following:
    | Username|JSomm|
    |Full Name|Joel Sommers|
    | Password|cosc|
    |Confirm Password|cosc|
    | Email|jsommers@colgate.edu|

  When I press "Create User Account"
  Then I should be on the user accounts page
  And I should see "User Account 'JSomm'" Successfully Created
  And I should see that user "JSomm" has name of "Joel Sommers"
  Given I am on the user accounts page
  When I follow "Edit profile details"
  And I fill in the following:
    | Email||
    | Child's Name  |Puppy                |
    | Child's Grade |3                    |
    | Address  |Good Boy Drive, Yorkshire |

  And press "Update Profile"
  Then I should be on the edit user account page
  And I should see "Please check your fields"
