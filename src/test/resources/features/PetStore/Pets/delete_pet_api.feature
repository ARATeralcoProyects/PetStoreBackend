@rest
Feature: Testing the feature to delete pets from the PetStore API

  This is an example of how to use the provided Rest steps of GingerSpec to test an API. For a
  complete list of all steps, check https://github.com/veepee-oss/gingerspec/wiki/Gherkin-steps#rest-steps

  You can run this feature directly in Intellij IDEA, for more info check:
  https://github.com/veepee-oss/gingerspec/wiki/Setting-up-your-IDE#running-cucumber-test
  Or by running the following command in the terminal: mvn verify -Dcucumber.filter.tags="@rest"

  This example uses https://jsonplaceholder.typicode.com, Fake Online REST API for Testing and Prototyping

  Scenario: Deleting a valid pet from the PetStore
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'DELETE' request to '/pet/2609'
    Then the service response status must be '200'


  Scenario: Trying to delete a pet from the PetStore with an Id that doesn't exists
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'DELETE' request to '/pet/999999999999'
    Then the service response status must be '404'

  Scenario: Trying to delete a pet from the PetStore with invalid id
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'DELETE' request to '/pet/ragnar'
    Then the service response status must be '400'