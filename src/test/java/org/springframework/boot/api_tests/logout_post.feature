# ********RoostGPT********

# Test generated by RoostGPT for test karate-test-credential using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /logout_post for http method type POST 
# RoostTestHash=64d33906e5
# 
# 

# ********RoostGPT********
Feature: Logout

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * def AUTH_TOKEN = karate.properties['AUTH_TOKEN']
    * configure headers = { 'Token': '#(AUTH_TOKEN)' }

  Scenario: Successful logout
    Given path '/logout'
    When method delete
    Then status 200
    And match header api-version == '1.0.0'

  Scenario Outline: Bad request logout
    Given path '/logout'
    When method delete
    Then status 400
    And match header api-version == '1.0.0'
    And match response contains { error: '#(error)', description: '#(description)' }
    
    Examples:
      | error      | description               |
      | error/code | Descriptive Error Message |

  Scenario Outline: Validation error logout
    Given path '/logout'  
    When method delete
    Then status 400
    And match header api-version == '1.0.0'
    And match response contains { error: '#regex ^validation/.*$', description: '#(description)', value: '#(value)', field: '#(field)', schema_field: '#(schema_field)' }
    
    Examples:
      | description               | value | field | schema_field |
      | Descriptive Error Message | {}    | email | email        |
