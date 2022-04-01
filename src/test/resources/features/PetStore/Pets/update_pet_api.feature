@rest
Feature: Testing the feature to update pets from the PetStore API

  This is an example of how to use the provided Rest steps of GingerSpec to test an API. For a
  complete list of all steps, check https://github.com/veepee-oss/gingerspec/wiki/Gherkin-steps#rest-steps

  You can run this feature directly in Intellij IDEA, for more info check:
  https://github.com/veepee-oss/gingerspec/wiki/Setting-up-your-IDE#running-cucumber-test
  Or by running the following command in the terminal: mvn verify -Dcucumber.filter.tags="@rest"

  This example uses https://jsonplaceholder.typicode.com, Fake Online REST API for Testing and Prototyping



  Scenario: Updating a pet with valid fields
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'PUT' request to '/pet' with body
           """
              {
                "id": 2,
                "category": {
                    "id": 5,
                    "name": "Ramu2"
                },
                "name": "Petro",
                "photoUrls": [
                    "Gopal"
                ],
                "tags": [
                    {
                        "id": 6,
                        "name": "Sankar"
                    }
                ],
                "status": "available"
            }
          """
    Then the service response status must be '200'

  Scenario: Updating a pet with invalid fields
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'PUT' request to '/pet' with body
           """
              {
                "id": 5,
                "category": {
                    "id": 5,
                    "name": "Ramu2"
                },
                "name": "Petro",
                "gender": "female",
                "photoUrls": [
                    "Gopal"
                ],
                "tags": [
                    {
                        "id": 6,
                        "name": "Sankar"
                    }
                ],
                "status": "available"
            }
          """
    Then the service response status must be '400'

  Scenario: Updating a pet without the id field
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'PUT' request to '/pet' with body
           """
              {
                "category": {
                    "id": 5,
                    "name": "Ramu2"
                },
                "name": "Petro",
                "photoUrls": [
                    "Gopal"
                ],
                "tags": [
                    {
                        "id": 6,
                        "name": "Sankar"
                    }
                ],
                "status": "available"
            }
          """
    Then the service response status must be '400'