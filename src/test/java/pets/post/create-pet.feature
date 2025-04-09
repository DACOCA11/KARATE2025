Feature: Create a new pet

  Background:
    * url "https://petstore.swagger.io/v2"
    * path "/pet"
    * def petName = "Chester"
    * def petId = 2693814
    * def r =
    """
    {
      "id": #(petId),
      "category": { "id": 0, "name": "string" },
      "name": "#(petName)",
      "photoUrls": ["string"],
      "tags": [{ "id": 0,"name": "string" }],
      "status": "available"
    }
    """

  @Pet
  Scenario: Add a pet
    Given request r
    When method post
    Then status 200
    And match response contains { id: '#(petId)', name: "#(petName)", status: 'available' }
    And def petcId = $.id
    And def petcName = $.name
    And def petcStatus = $.status