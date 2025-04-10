Feature: Search pet from petStore

  Background:
    * url "https://petstore.swagger.io/v2/pet"
    * call read("../post/create-pet.feature")

  Scenario: Find pet by ID
    Given path petIdr
    When method get
    Then status 200
    And match response contains { id: '#(petIdr)', name: "#(petNamer)", status: '#(petStatusr)' }
    And def petIdr = $.id
    And def petNamer = $.name
    And def petStatusr = $.status