# ********RoostGPT********

# Test generated by RoostGPT for test karate-claude using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /me_get for http method type GET 
# RoostTestHash=ae6b8ce5ab
# 
# 

# ********RoostGPT********
Feature: Account API

Background:
  * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
  * url urlBase
  * def AUTH_TOKEN = karate.properties['AUTH_TOKEN']
  * headers { Authorization: '#(AUTH_TOKEN)' }

Scenario: Get my account details
  Given path '/me'
  When method GET
  Then status 200
  And match header api-version == '1.0.0'
  And match response ==
    """
    {
      id: '#uuid',
      did: '##string',
      name: '#? _.length >= 1 && _.length <= 100',
      image: '#regex ^\\w+:(\\/?\\/?)[^\\s]+',
      email: '#regex ^(([^<>()[\\]\\\\.,;:\\s@\\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\\"]+)*)|(\\\".+\\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))',
      settings: '#object',
      createdAt: '#date',
      updatedAt: '#date'
    }
    """

Scenario: Get account details with invalid authorization
  Given path '/me'
  And headers { Authorization: 'invalid-token' }
  When method GET
  Then status 401
  And match header api-version == '1.0.0'
  And match response ==
    """
    {
      error: '#string',
      description: '#string'
    }
    """

Scenario: Get account details with missing authorization
  Given path '/me'
  And headers { }
  When method GET
  Then status 401
  And match header api-version == '1.0.0'
  And match response ==
    """
    {
      error: '#string',
      description: '#string'
    }
    """
