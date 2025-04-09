Feature: Search pet from petStore

  Background:
    * call read("../post/create-pet.feature")
    * url "https://petstore.swagger.io/v2/pet"

  Scenario: Find pet by ID
    Given path petcId
    When method get
    Then status 200
    And match response contains { id: '#(petcId)', name: "#(petcName)", status: '#(petcStatus)' }
    And def petfId = $.id
    And def petfName = $.name
    And def petfStatus = $.status