# ********RoostGPT********

# Test generated by RoostGPT for test karate-test using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /employees_post for http method type POST 
# RoostTestHash=b517afeac4
# 
# 

# ********RoostGPT********
Feature: Employee Management API Tests

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authHeader = { 'Authorization': '#(karate.properties['AUTH_TOKEN'])' }

Scenario Outline: Create employee and validate the response
  Given path 'employees'
  And header Authorization = authHeader
  And request 
  """
  {
    "id": "<id>",
    "jobTitle": "<jobTitle>",
    "name": "<name>",
    "email": "<email>"
  }
  """
  When method post
  Then status 201
  And match response contains {description: 'employee created'}

  Examples:
    | id                                  | jobTitle       | name      | email               |
    | 'd290f1ee-6c54-4b01-90e6-d701748f0851'  | 'System Analyst' | 'John Smith' | 'john.smith@acme-corp.com' |
