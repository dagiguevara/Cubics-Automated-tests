@LoginProfile
Feature: Login Profile
  As an user of the Cubits
  I want to login my account profile using my credentials
  In order to see my profile in cubics
 
Background: User navigates to Company home page
    Given I am on the cubics login page on URL "https://cubits.com/users/sign_in"
    When I should see "LOG IN TO CUBITS" message
  
  
  Scenario: Successful login 
    When I fill in email with "dagiguevara@gmail.com"
    And I fill in Password with "Password123!@#"
    And I click on the "LOGIN" button
    Then I should see activity page "WELCOME DONALDO" message
   
 
  Scenario Outline: Failed login using wrong credentials
  
    When I fill in email with "<email>"
    And I fill in Password with "<password>"
    And I click on the "Login" button
    Then I should see "<warning>" message

    Examples:
    | email         | password | warning |
    | test@test.com | password | INVALID EMAIL ADDRESS OR PASSWORD.|
    | test.com      | 1        | invalid email format |  
    |               | password | INVALID EMAIL ADDRESS OR PASSWORD.|
    | test@test.com |          | INVALID EMAIL ADDRESS OR PASSWORD.|
    



   