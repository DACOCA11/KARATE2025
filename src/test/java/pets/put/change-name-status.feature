Feature: Update pet from PetStore

  Background:
    * call read("../get/search-pet.feature")
    * url "https://petstore.swagger.io/v2"
    * path "/pet"
    * def petNameEdited = "Chostito"
    * def statusEdited = "sold"
    * def r2 =
    """
    {
      "id": "#(petfId)",
      "category": { "id": 0, "name": "string" },
      "name": "#(petNameEdited)",
      "photoUrls": ["string"],
      "tags": [{ "id": 0,"name": "string" }],
      "status": "#(statusEdited)"
    }
    """

  Scenario: Update pet
    Given request r2
    When method put
    Then status 200
    And match response contains { id: '#(petfId)', name: "#(petNameEdited)", status: '#(statusEdited)' }
    And def petgId = $.id
    And def petNameUpdated = $.name
    And def petStatusUpdated = $.status