@rest
Feature: Testing the feature to add images to pets from the PetStore API

  This is an example of how to use the provided Rest steps of GingerSpec to test an API. For a
  complete list of all steps, check https://github.com/veepee-oss/gingerspec/wiki/Gherkin-steps#rest-steps

  You can run this feature directly in Intellij IDEA, for more info check:
  https://github.com/veepee-oss/gingerspec/wiki/Setting-up-your-IDE#running-cucumber-test
  Or by running the following command in the terminal: mvn verify -Dcucumber.filter.tags="@rest"

  This example uses https://jsonplaceholder.typicode.com, Fake Online REST API for Testing and Prototyping

  Scenario: Adding a new image to a valid pet
    Given I securely send requests to '${envProperties:petstore.url}'
    And I set headers:
      | Content-Type | multipart/form-data |
    And I add the file in 'schemas/labrador.jpg' to the request
    When I send a 'POST' request to '/pet/1/uploadImage'
    Then the service response status must be '200'

  Scenario: Trying to add a new image to a pet that does not exist
    Given I securely send requests to '${envProperties:petstore.url}'
    And I set headers:
      | Content-Type | multipart/form-data |
    And I add the file in 'schemas/labrador.jpg' to the request
    When I send a 'POST' request to '/pet/999999999999/uploadImage'
    Then the service response status must be '200'