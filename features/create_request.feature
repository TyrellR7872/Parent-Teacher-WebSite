Feature: Create a funding request form to be submitted and added to a user's submitted requests
  As a Parent or Teacher,
  So that I can communicate my ideas with school administrators at Hamilton High School,
  I want to be presented with a funding request form to fill out and submit with my needs and desires

  Scenario: Fill out the form and submit it successfully
    Given I am a new, signed-in user account
    When I follow "Create a Request"
    Then I should be on the new request page
    And I should see "What type of request are you making?"
    When I check "Funding"
    And I press "Continue"
    Then I should see "Funding Request Form"
    When I press "Back"
    Then I should see "What type of request are you making?"
    And I press "Continue"
    When I fill in the following:
      | Name of Project                    | Bake Sale             |
      | Estimated Number of Students to Benefit              | 300        |
      | Estimated Cost of Project                   | 500.50                   |
      | Brief Description of How the Requested Funds Will Advance the PTO’s Mission and Who will Benefit from the Purchased Item(s) or Activity| Cookies,Cupcakes,Etc.                         |

    When I press "Submit Request"
    Then I should be on the root page
    And I should see "Request saved and submitted!"
    When I follow "Hello, Test User"
    Then I should see "Bake Sale"
    When I follow "Bake Sale"
    Then I should see "Cookies,Cupcakes,Etc."
    And I should see "Approved? No"

  Scenario: Fill out the form and submit it
    Given I am a new, signed-in user account
    When I follow "Create a Request"
    Then I should be on the new request page
    And I should see "What type of request are you making?"
    When I check "Funding"
    And I press "Continue"
    When I fill in the following:
      |Name of Project                   |               |
      | Estimated Number of Students to Benefit              | 300        |
      | Estimated Cost of Project                   | 500.50                   |
      | Brief Description of How the Requested Funds Will Advance the PTO’s Mission and Who will Benefit from the Purchased Item(s) or Activity| Cookies,Cupcakes,Etc.|

    Then I should be on the requests page
