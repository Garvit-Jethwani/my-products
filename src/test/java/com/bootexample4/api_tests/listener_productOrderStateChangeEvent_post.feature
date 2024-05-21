
// ********RoostGPT********
/*

# Test generated by RoostGPT for test ProductOrde-Karate-productOrder-api using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /listener/productOrderStateChangeEvent_post for http method type POST 
# RoostTestHash=6f5fd9fdba
# 
# 

roost_feedback [5/21/2024, 4:38:34 PM]:Add appropriate comments.
*/

// ********RoostGPT********


# Test generated by RoostGPT for test ProductOrde-Karate-productOrder-api using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /listener/productOrderStateChangeEvent_post for http method type POST 
# RoostTestHash=6f5fd9fdba
# 
# 

Feature: State Change Event By Client

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * configure headers = { Authorization: '#(authToken)' }

  # Test scenario for successful closing notification
  Scenario: Successful Closing Notification
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      {
        "notification": {
          "date": "2020-12-16T10:09:31-03:00",
          "customer": {
            "subscriberId": "234567654"
          },
          "order": {
            "id": "20230315000001",
            "correlationOrder": "10",
            "associatedDocument": "VTT001",
            "type": "Encerramento",
            "code": "0",
            "description": "Ordem encerrada com sucesso.",
            "lostEquipment": "True",
            "resource": {
              "gponAccess": "A000009QS",
              "fiberPath": {
                "items": {
                  "item": [
                    {
                      "name": "enderecoCDO",
                      "value": "RUA GENERAL RENATO PAQUET, 199, BARRA DA TIJUCA, RIO DE JANEIRO - RJ 22793913"
                    },
                    {
                      "name": "producer_olt",
                      "value": "HUAWEI"
                    },
                    {
                      "name": "CDO",
                      "value": "CDOI-4704-PTP.FO.O:45"
                    },
                    {
                      "name": "CDO",
                      "value": "CDOI-4704-PTP.FO.I:S32_2_IN 1"
                    },
                    {
                      "name": "estacao",
                      "value": "BEL"
                    },
                    {
                      "name": "cnl",
                      "value": "CBF"
                    },
                    {
                      "name": "olt",
                      "value": "MA-CTO04-GHUA"
                    },
                    {
                      "name": "primaryCable",
                      "value": "MA.CTO.F-7.CEO-15/1"
                    },
                    {
                      "name": "secondaryCable",
                      "value": "MA.CTO.F-7.CEOS-165"
                    }
                  ]
                }
              }
            }
          }
        }
      }
      """
    When method post
    Then status 204

  # Test scenario for successful cancel notification
  Scenario: Successful Cancel Notification
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      {
        "notification": {
          "date": "2021-09-29T18:42:24.641-03:00",
          "customer": {
            "subscriberId": "234567654"
          },
          "order": {
            "id": "20230315000001",
            "correlationOrder": "10",
            "associatedDocument": "VTT001",
            "type": "Cancelamento",
            "code": "2",
            "description": "Ordem cancelada"
          }
        }
      }
      """
    When method post
    Then status 204

  # Test scenario for ONT already in use
  Scenario: ONT already in use
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      {
        "notification": {
          "date": "2021-10-26T17:53:25.497-03:00",
          "customer": {
            "subscriberId": "234567654"
          },
          "order": {
            "id": "20230315000001",
            "correlationOrder": "10",
            "associatedDocument": "VTT001",
            "type": "Encerramento",
            "code": "-1",
            "description": "O Equipamento já está em uso por outro cliente",
            "lostEquipment": "True",
            "resource": {
              "fiberPath": {
                "items": ""
              }
            }
          }
        }
      }
      """
    When method post
    Then status 204

  # Test scenario for closing notification with ontOwner Vtal - Install
  Scenario: Closing Notification (ontOwner Vtal - Install)
    Given path '/listener/productOrderStateChangeEvent'  
    And request
      """
      {
        "notification": {
          "date": "2022-12-26T12:15:35.174-03:00",
          "customer": {
            "subscriberId": "234567654"
          },
          "order": {
            "id": "20230315000001",
            "correlationOrder": "10",
            "associatedDocument": "VTT001",
            "type": "Encerramento",
            "code": "0",
            "description": "BA de campo encerrado com sucesso",
            "resource": {
              "gponAccess": "A000009QS",
              "devices": {
                "device": [
                  {
                    "category": "ONT",
                    "type": "PhsysicalResource",
                    "description": "Equipment - ONT device",
                    "state": "completed",
                    "usageState": "active",
                    "startOperatingDate": "2022-12-26T12:15:35.174-03:00",
                    "resourceCharacteristic": [
                      {
                        "name": "serialNumber",
                        "value": "0251990119989"
                      },
                      {
                        "name": "firmware",
                        "value": "FW-XPTO-123"
                      },
                      {
                        "name": "manufacturer",
                        "value": "Sagemcom"
                      },
                      {
                        "name": "model",
                        "value": "F@ST 5340 TFN"
                      }
                    ]
                  }
                ]
              },
              "fiberPath": {
                "items": {
                  "item": [
                    {
                      "name": "enderecoCDO",
                      "value": "RUA GENERAL RENATO PAQUET, 199, BARRA DA TIJUCA, RIO DE JANEIRO - RJ 22793913"
                    },
                    {
                      "name": "producer_olt", 
                      "value": "HUAWEI"
                    },
                    {
                      "name": "CDO",
                      "value": "CDOI-4704-PTP.FO.O:45"
                    },
                    {
                      "name": "CDO",
                      "value": "CDOI-4704-PTP.FO.I:S32_2_IN 1"
                    },
                    {
                      "name": "estacao",
                      "value": "BEL"
                    },
                    {
                      "name": "cnl",
                      "value": "CBF"
                    },
                    {
                      "name": "olt",
                      "value": "MA-CTO04-GHUA"
                    },
                    {
                      "name": "primaryCable",
                      "value": "MA.CTO.F-7.CEO-15/1"
                    },
                    {
                      "name": "secondaryCable",
                      "value": "MA.CTO.F-7.CEOS-165"
                    }
                  ]
                }
              }
            }
          }
        }
      }
      """
    When method post
    Then status 204
