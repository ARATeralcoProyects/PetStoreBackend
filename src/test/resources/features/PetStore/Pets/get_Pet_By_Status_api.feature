@rest
Feature: Testing the feature to get pets lists by the Status from the PetStore API

  This is an example of how to use the provided Rest steps of GingerSpec to test an API. For a
  complete list of all steps, check https://github.com/veepee-oss/gingerspec/wiki/Gherkin-steps#rest-steps

  You can run this feature directly in Intellij IDEA, for more info check:
  https://github.com/veepee-oss/gingerspec/wiki/Setting-up-your-IDE#running-cucumber-test
  Or by running the following command in the terminal: mvn verify -Dcucumber.filter.tags="@rest"

  This example uses https://jsonplaceholder.typicode.com, Fake Online REST API for Testing and Prototyping

  Scenario: Try to get the pets from the store that are available
    Given I securely send requests to '${envProperties:petstore.url}'
    Given I set url parameters:
      | status | sold |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '200'

  Scenario: Try to get a list of pets by giving 2 status
    Given I securely send requests to '${envProperties:petstore.url}'
    Given I set url parameters:
      | status | available, sold |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '200'

  Scenario: Try to get a list of pets by giving 3 status
    Given I securely send requests to '${envProperties:petstore.url}2'
    Given I set url parameters:
      | status | available, pending, sold |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '200'

  Scenario: Try to get a pets list by giving a invalid status
    Given I securely send requests to '${envProperties:petstore.url}'
    Given I set url parameters:
      | status | rent |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '400'

  Scenario: Try to get a pets list by no giving status
    Given I securely send requests to '${envProperties:petstore.url}'
    Given I set url parameters:
      | status |  |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '400'

  Scenario: Try to get a pets list by giving a special characters status
    Given I securely send requests to '${envProperties:petstore.url}'
    Given I set url parameters:
      | status | !$%·$# |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '400'