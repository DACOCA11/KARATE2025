Feature: Update pet from PetStore

  Background:
    * call read("../get/search-pet.feature")
    * url "https://petstore.swagger.io/v2"
    * def updateData = karate.read('classpath:pets/data/updateData.csv')
    * def b = karate.read('classpath:pets/data/change-name.json')

  Scenario Outline: Change name and status
    Given path "/pet"
    And set b.id = petIdr
    And set b.name = "<petName>"
    And set b.status = "<petStatus>"
    And request b
    When method put
    Then status 200
    And match response contains { id: '#(petIdr)', name: "<petName>", status: '<petStatus>' }
    And def petIdr = $.id
    And def petNameUpdated = $.name
    And def petStatusUpdated = $.status
    Examples:
      | karate.read('classpath:pets/data/updateData.csv') |