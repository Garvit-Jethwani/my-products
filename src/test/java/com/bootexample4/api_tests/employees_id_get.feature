# ********RoostGPT********

# Test generated by RoostGPT for test karate-claude using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /employees/{id}_get for http method type GET 
# RoostTestHash=36bc161fb6
# 
# 

# ********RoostGPT********
Feature: Employee API

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def authToken = karate.properties['AUTH_TOKEN']
  * configure headers = { 'Authorization': '#(authToken)' }

Scenario: Get employee by ID - Success
  Given path '/employees/d290f1ee-6c54-4b01-90e6-d701748f0851'
  When method GET
  Then status 200
  And match response == 
    """
    {
      "id": "d290f1ee-6c54-4b01-90e6-d701748f0851",
      "jobTitle": "System Analyst",
      "name": "John Smith",
      "email": "john.smith@acme-corp.com"
    }
    """
  And match response.id == "d290f1ee-6c54-4b01-90e6-d701748f0851"
  And match response.jobTitle == "System Analyst"
  And match response.name == "John Smith"
  And match response.email == "john.smith@acme-corp.com"

Scenario: Get employee by ID - Response contains expected fields
  Given path '/employees/d290f1ee-6c54-4b01-90e6-d701748f0851' 
  When method GET
  Then status 200
  And match response contains
    """
    {
      "email": "john.smith@acme-corp.com",
      "jobTitle": "System Analyst", 
      "name": "John Smith"
    }
    """

Scenario: Get employee by ID - Not Found
  Given path '/employees/non-existent-id'
  When method GET 
  Then status 404
