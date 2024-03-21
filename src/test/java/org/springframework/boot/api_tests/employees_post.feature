# ********RoostGPT********

# Test generated by RoostGPT for test karate-test using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /employees_post for http method type POST 
# RoostTestHash=b517afeac4
# 
# 

# ********RoostGPT********
Feature: Employee API

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['AUTH_TOKEN']

  Scenario Outline: Add Employee
    Given path '/employees'
    And request
    """
    {
      "id": "<id>",
      "jobTitle": "<jobTitle>",
      "name": "<name>",
      "email": "<email>"
    }
    """
    When method POST
    Then status <expectedStatus>
    And match response == <expectedResponse>
    
    Examples:
      | id                                   | jobTitle       | name        | email                     | expectedStatus | expectedResponse                                  |
      | d290f1ee-6c54-4b01-90e6-d701748f0851 | System Analyst | John Smith  | john.smith@acme-corp.com  | 201            | ''                                                |
      | d290f1ee-6c54-4b01-90e6-d701748f0851 | System Analyst | John Smith  | john.smith@acme-corp.com  | 409            | ''                                                |
      |                                      | System Analyst | John Smith  | john.smith@acme-corp.com  | 400            | {"message": "invalid input, object invalid"}      |
      | d290f1ee-6c54-4b01-90e6-d701748f0851 |                | John Smith  | john.smith@acme-corp.com  | 400            | {"message": "invalid input, object invalid"}      |
      | d290f1ee-6c54-4b01-90e6-d701748f0851 | System Analyst |             | john.smith@acme-corp.com  | 400            | {"message": "invalid input, object invalid"}      |  
      | d290f1ee-6c54-4b01-90e6-d701748f0851 | System Analyst | John Smith  |                           | 400            | {"message": "invalid input, object invalid"}      |

  Scenario: Get Employee
    Given path '/employees'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And match response == '#[_ >= 0]'
    And match each response contains 
    """
    {
      "id": "#uuid",
      "jobTitle": "#string",
      "name": "#string", 
      "email": "#string"
    }
    """
