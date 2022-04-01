@rest
Feature: Testing the feature to add new users to the PetStore API

  This is an example of how to use the provided Rest steps of GingerSpec to test an API. For a
  complete list of all steps, check https://github.com/veepee-oss/gingerspec/wiki/Gherkin-steps#rest-steps

  You can run this feature directly in Intellij IDEA, for more info check:
  https://github.com/veepee-oss/gingerspec/wiki/Setting-up-your-IDE#running-cucumber-test
  Or by running the following command in the terminal: mvn verify -Dcucumber.filter.tags="@rest"

  This example uses https://jsonplaceholder.typicode.com, Fake Online REST API for Testing and Prototyping

  Scenario: Adding a new user with valid data
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/user' based on 'schemas/userdata.json' as 'json'
    And I save element '$' in environment variable 'response'
    #log ${response}
    Then the service response status must be '200'

  Scenario: Adding a new user with special characters on the username
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/user' with body
           """
              {
                "username": "ñaña#3232",
                "firstName": "Robert",
                "lastName": "Corput",
                "email": "string@string.com",
                "password": "string",
                "phone": "659698215",
                "userStatus": 0
              }
          """
    Then the service response status must be '200'

  Scenario: Adding a new user with some fields missing
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/user' with body
           """
              {
                "lastName": "Corput",
                "email": "string@string.com",
                "password": "string",
                "userStatus": 0
              }
          """
    Then the service response status must be '200'

  Scenario: Adding a new user without body
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/user' with body
           """
              {

              }
          """
    Then the service response status must be '400'

  Scenario: Adding a new user with special characters on the username
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/user' with body
           """
              {
                "username": "Krewella",
                "firstName": "Jahaan",
                "lastName": "Corput",
                "email": "string@string.com",
                "password": "string",
                "phone": "659698215",
                "birthday": "28-05-1996",
                "userStatus": 0
              }
          """
    Then the service response status must be '200'

  Scenario: Try to add a user that already exists
    Given I securely send requests to '${envProperties:petstore.url}'
    When I send a 'POST' request to '/user' based on 'schemas/userdata.json' as 'json'
    Then the service response status must be '200'