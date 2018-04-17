Feature: Sign in and sign out of a user's account
  As A Parent or Teacher
  So that I can safely access my personal account
  I want to log in using my username and password or log out when I am signed in

  Background: the website has already has existing accounts
    Given these UserAccounts:
    | password  | email                | accounttype| name            | childname       | childgrade| homeaddress |
    | roberts   | troberts@colgate.edu |  teacher   | Tyrell Roberts  | Little T        | 4         | 13 Oak Dr   |

  Scenario
