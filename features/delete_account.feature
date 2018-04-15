Feature: Delete a user account
  As a Teacher, Staff Member, Parent,
  So that I can remove my information from our PTO website,
  I want to be able to delete my user account on the website permanently.

  Background: the website has already has existing accounts
    Given the following UserAccounts:
    | username  | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | tyrell    | roberts   | troberts@colgate.edu |  teacher   | Tyrell Roberts  | Little T        | 4         | 13 Oak Dr   |

  Scenario: Delete a user account with success
    Given I am on the user accounts page
    When I press "Delete User Account"
    Then I should be on the user accounts page
    And I should not see "Delete User Account"
    And I should see "Are you certain that you wish to delete this user account?"
    And I should see "No"
    And I should see "Confirm"
    And I should not see "Delete User Account"
    When I press "Confirm"
    Then I should be on the user accounts page
    And I should see "User Account Successfully Deleted"

  Background: the website has already has existing accounts
    Given the following UserAccounts:
    | username  | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | tyrell    | roberts   | troberts@colgate.edu |  teacher   | Tyrell Roberts  | Little T        | 4         | 13 Oak Dr   |

  Scenario: Delete a user account confirmation failed
    Given I am on the user accounts page
    When I press "Delete User Account"
    Then I should be on the user accounts page
    And I should not see "Delete User Account"
    And I should see "Are you certain that you wish to delete this user account?"
    And I should see "No"
    And I should see "Confirm"
    When I press "No"
    Then I should be on the user account page
    And I should not see "User Account Successfully Deleted"
    And I should see "Edit Profile Details"
    And I should see "Delete User Account"
    And I should see "Account Details for tyrell"
