@rest
Feature: Testing a PetStore API example

  This is an example of how to use the provided Rest steps of GingerSpec to test an API. For a
  complete list of all steps, check https://github.com/veepee-oss/gingerspec/wiki/Gherkin-steps#rest-steps

  You can run this feature directly in Intellij IDEA, for more info check:
  https://github.com/veepee-oss/gingerspec/wiki/Setting-up-your-IDE#running-cucumber-test
  Or by running the following command in the terminal: mvn verify -Dcucumber.filter.tags="@rest"

  This example uses https://jsonplaceholder.typicode.com, Fake Online REST API for Testing and Prototyping

  Scenario: Creating a new valid object and checking that's correctly done
    Given I securely send requests to 'petstore.swagger.io/v2'
    When I send a 'POST' request to '/pet' based on 'schemas/petdata.json' as 'json'
    And I save element '$' in environment variable 'response'
    And 'response' matches the following cases:
    | $.name   | equal     | Ragnar |
    | $.status | contains  | so     |
    | $.id     | not equal | 1      |

