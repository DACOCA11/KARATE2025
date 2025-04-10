Feature: Create pet with CSV file

  Background:
    * url "https://petstore.swagger.io/v2"
    * def petData = karate.read('classpath:pets/data/petData.csv')
    * def body = karate.read('classpath:pets/data/create-pet.json')

  Scenario Outline: Pet CSV
    Given path "/pet"
    And set body.id = "<petId>"
    And set body.name = "<petName>"
    And request body
    When method post
    Then status 200
    And match response contains { id: <petId>, name: "<petName>", status: "available" }
    And def petIdr = $.id
    And def petNamer = $.name
    And def petStatusr = $.status

    Examples:
      | karate.read('classpath:pets/data/petData.csv') |
