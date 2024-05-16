# ********RoostGPT********

# Test generated by RoostGPT for test ProductOrde-Karate-productOrder-api using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /productOrder_post for http method type POST 
# RoostTestHash=13e6a9adf7
# 
# 

# ********RoostGPT********
Feature: Test /productOrder API endpoint

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    #* configure headers = { Authorization: '#(karate.properties['AUTH_TOKEN'])' }

  Scenario Outline: Create a new order with valid request
    Given path '/productOrder'
    And request
      """
      {
        "order": {
          "correlationOrder": "<correlationOrder>",
          "associatedDocument": "<associatedDocument>",
          "associatedDocumentDate": "<associatedDocumentDate>",
          "type": "<type>",
          "infraType": "<infraType>",
          "customer": {
            "name": "<name>",
            "subscriberId": "<subscriberId>",
            "phoneNumber": {
              "phoneNumbers": [
                "<phoneNumber1>",
                "<phoneNumber2>",
                "<phoneNumber3>"
              ]
            },
            "workContact": {
              "name": "<workContactName>",
              "email": "<workContactEmail>",
              "phone": "<workContactPhone>"
            }
          },
          "appointment": {
            "hasSlot": <hasSlot>,
            "date": "<appointmentDate>",
            "mandatoryType": "<mandatoryType>",
            "workOrderId": "<workOrderId>"
          },
          "addresses": {
            "address": {
              "id": <addressId>,
              "inventoryId": "<inventoryId>",
              "reference": "<reference>",
              "complement": {
                "complements": [
                  {
                    "type": "<complementType>",
                    "value": "<complementValue>"
                  }
                ]
              }
            }
          },
          "products": {
            "product": [
              {
                "catalogId": "<catalogId>",
                "action": "<action>"
              }
            ]
          }
        }
      }
      """
    When method POST
    Then status 201
    And match response.control.type == 'S'
    And match response.control.code == '201'
    And match response.control.message == 'Created'
    And match response.order.id == '#string'

    Examples:
      | correlationOrder | associatedDocument | associatedDocumentDate     | type       | infraType | name          | subscriberId | phoneNumber1 | phoneNumber2 | phoneNumber3 | workContactName | workContactEmail     | workContactPhone | hasSlot | appointmentDate     | mandatoryType | workOrderId | addressId | inventoryId | reference          | complementType | complementValue | catalogId | action    |
      | 10               | VTT001             | 2021-06-09T18:20:53-03:00  | Instalacao | FTTH      | Sandbox V.tal | SVTAL001     | 000000000    |              |              | sindico Vtal    | sindicovtal@vtal.com | 21999900000      | true    | 2021-05-05T08:00:00 | Obrigatorio   | SA-562403   | 14393     | 1766156     | Do lado da padaria | ES             | ARC201          | BL_200MB  | adicionar |
      | 10               | VTT001             | 2021-06-09T18:20:53-03:00  | Instalacao | FTTP      | Sandbox V.tal | SVTAL001     | 21999999999  |              |              | sindico Vtal    | sindicovtal@vtal.com | 21999900000      | false   |                     | Permitido     |             | 14393     | 1766156     | Proximo a padaria  | ES             | ARC201          | BL_200MB  | adicionar |

  Scenario: Create a new order with invalid request
    Given path '/productOrder' 
    And request
      """
      {
        "invalid": "request"
      }
      """
    When method POST
    Then status 400
    And match response.control.type == 'E'
    And match response.control.code == '400'
    And match response.control.message contains 'Bad Request'

  Scenario: Create a new order with unauthorized credentials
    Given path '/productOrder'
    And request
      """
      {
        "order": {
          "correlationOrder": "10",
          "associatedDocument": "VTT001",
          "associatedDocumentDate": "2021-06-09T18:20:53-03:00",
          "type": "Instalacao",
          "infraType": "FTTH",
          "customer": {
            "name": "Sandbox V.tal",
            "subscriberId": "SVTAL001",
            "phoneNumber": {
              "phoneNumbers": [
                "000000000",
                "",
                ""  
              ]
            },
            "workContact": {
              "name": "sindico Vtal",
              "email": "sindicovtal@vtal.com",
              "phone": "21999900000"
            }
          },
          "appointment": {
            "hasSlot": true,
            "date": "2021-05-05T08:00:00",
            "mandatoryType": "Obrigatorio",
            "workOrderId": "SA-562403"
          },
          "addresses": {
            "address": {
              "id": 14393,
              "inventoryId": "1766156",
              "reference": "Do lado da padaria",
              "complement": {
                "complements": [
                  {
                    "type": "ES",
                    "value": "ARC201"
                  }
                ]
              }
            }
          },
          "products": {
            "product": [
              {
                "catalogId": "BL_200MB",
                "action": "adicionar"
              }
            ]
          }
        }
      }
      """
    And configure headers = { Authorization: 'InvalidToken' }
    When method POST
    Then status 403
    And match response.control.type == 'E'
    And match response.control.code == '403'
    And match response.control.message contains 'Forbidden - Scope Not Permitted'

  Scenario: Create a new order with exceeded quota
    Given path '/productOrder'
    And request
      """
      {
        "order": {
          "correlationOrder": "10",
          "associatedDocument": "VTT001", 
          "associatedDocumentDate": "2021-06-09T18:20:53-03:00",
          "type": "Instalacao",
          "infraType": "FTTH",
          "customer": {
            "name": "Sandbox V.tal",
            "subscriberId": "SVTAL001",
            "phoneNumber": {
              "phoneNumbers": [
                "000000000",
                "",
                ""
              ]
            },
            "workContact": {
              "name": "sindico Vtal",
              "email": "sindicovtal@vtal.com",
              "phone": "21999900000"
            }
          },
          "appointment": {
            "hasSlot": true,
            "date": "2021-05-05T08:00:00",
            "mandatoryType": "Obrigatorio",
            "workOrderId": "SA-562403"
          },
          "addresses": {
            "address": {
              "id": 14393,
              "inventoryId": "1766156",
              "reference": "Do lado da padaria",
              "complement": {
                "complements": [
                  {
                    "type": "ES",
                    "value": "ARC201"
                  }
                ]
              }
            }
          },
          "products": {
            "product": [
              {
                "catalogId": "BL_200MB",
                "action": "adicionar"
              }
            ]
          }
        }
      }
      """
    When method POST
    Then status 429 
    And match response.control.type == 'E'
    And match response.control.code == '429'
    And match response.control.message == 'Too Many Requests - Exceeded Quota'
