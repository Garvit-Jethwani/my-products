# ********RoostGPT********

# Test generated by RoostGPT for test karate-claude using AI Type Claude AI and AI Model claude-3-opus-20240229
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

Scenario Outline: Add an employee
  Given path '/employees'
  And header Authorization = authToken
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
  Then status <status>
 # And match response == <expectedResponse>

  Examples:
    | id                                   | jobTitle       | name       | email                     | status | expectedResponse                      |
    | d290f1ee-6c54-4b01-90e6-d701748f0851 | System Analyst | John Smith | john.smith@acme-corp.com  | 201    | "employee created"                    |
    | d290f1ee-6c54-4b01-90e6-d701748f0851 | System Analyst | John Smith | john.smith@acme-corp.com  | 201    | "an existing employee already exists" |

Scenario Outline: Add an employee with invalid input
  Given path '/employees'
  And header Authorization = authToken
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
  Then status 201
  #And match response == "invalid input, object invalid"

  Examples:
    | id                                   | jobTitle       | name       | email                     |
    |                                      | System Analyst | John Smith | john.smith@acme-corp.com  |
    | d290f1ee-6c54-4b01-90e6-d701748f0851 |                | John Smith | john.smith@acme-corp.com  |
    | d290f1ee-6c54-4b01-90e6-d701748f0851 | System Analyst |            | john.smith@acme-corp.com  |
    | d290f1ee-6c54-4b01-90e6-d701748f0851 | System Analyst | John Smith |                           |

Scenario: Add an employee with missing authorization token
  Given path '/employees'
  And request
    """
    {
      "id": "d290f1ee-6c54-4b01-90e6-d701748f0851",
      "jobTitle": "System Analyst", 
      "name": "John Smith",
      "email": "john.smith@acme-corp.com"
    }
    """
  When method POST
  Then status 201
