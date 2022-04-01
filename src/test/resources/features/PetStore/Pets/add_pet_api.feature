@rest
Feature: Testing the feature to create new pets for the PetStore API

  This is an example of how to use the provided Rest steps of GingerSpec to test an API. For a
  complete list of all steps, check https://github.com/veepee-oss/gingerspec/wiki/Gherkin-steps#rest-steps

  You can run this feature directly in Intellij IDEA, for more info check:
  https://github.com/veepee-oss/gingerspec/wiki/Setting-up-your-IDE#running-cucumber-test
  Or by running the following command in the terminal: mvn verify -Dcucumber.filter.tags="@rest"

  This example uses https://jsonplaceholder.typicode.com, Fake Online REST API for Testing and Prototyping

  Scenario: Adding a new pet with valid data
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/pet' based on 'schemas/petdata.json' as 'json'
    And I save element '$' in environment variable 'response'
    And 'response' matches the following cases:
    | $.name   | equal     | Ragnar |
    | $.status | contains  | so     |
    | $.id     | not equal | 1      |

  Scenario: Adding a pet without the mandatory field 'name'
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/pet' based on 'schemas/petdata.json' as 'json' with:
      | $.status | UPDATE | rent |
    Then the service response status must be '400'

  Scenario: Adding a pet without the mandatory field 'photoUrls'
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/pet' with body
           """
              {
                "category": {
                  "id": 0,
                  "name": "string"
                },
                "name": "Elois",
                "tags": [
                  {
                    "id": 0,
                    "name": "string"
                  }
                ],
                "status": "sold"
              }
          """
    Then the service response status must be '400'

  Scenario: Adding a pet without the mandatory fields 'name' and 'photoUrls'
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/pet' with body
           """
              {
                "category": {
                  "id": 0,
                  "name": "string"
                },
                "tags": [
                  {
                    "id": 0,
                    "name": "string"
                  }
                ],
                "status": "sold"
              }
          """
    Then the service response status must be '400'