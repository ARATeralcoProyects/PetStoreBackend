@rest
Feature: Testing the feature to get a pet from the PetStore API

  This is an example of how to use the provided Rest steps of GingerSpec to test an API. For a
  complete list of all steps, check https://github.com/veepee-oss/gingerspec/wiki/Gherkin-steps#rest-steps

  You can run this feature directly in Intellij IDEA, for more info check:
  https://github.com/veepee-oss/gingerspec/wiki/Setting-up-your-IDE#running-cucumber-test
  Or by running the following command in the terminal: mvn verify -Dcucumber.filter.tags="@rest"

  This example uses https://jsonplaceholder.typicode.com, Fake Online REST API for Testing and Prototyping

  Scenario: Try to get pet data with valid id
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'GET' request to '/pet/7574746'
    Then the service response status must be '200'
    And I save element '$' in environment variable 'pet'
    #log ${pet}
    And 'pet' matches the following cases:
      | $.id   | equal | 7574746 |
      | $.name | contains | dy   |

  Scenario: Try to get pet data from a id that doesn't exists
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'GET' request to '/pet/9999999999'
    Then the service response status must be '404'


  Scenario: Try to get pet data from a invalid id
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'GET' request to '/pet/kitten'
    Then the service response status must be '404'


  Scenario: Try to get pet data from a negative id
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'GET' request to '/pet/-1'
    Then the service response status must be '404'


  Scenario: Try to get pet data with id zero
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'GET' request to '/pet/0'
    Then the service response status must be '404'