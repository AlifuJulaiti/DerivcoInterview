Feature: API Search Functionality

  #	This Scenario checks if we can search by name by checking for status code
  Scenario Outline: The system shall include a method to search by cocktail name
    When User search for cocktail input "<Drinks>"
    Then User should be able to search for cocktail status code "<StatusCode>"

    Examples: 
      | Drinks        | StatusCode |
      | Margarita     |        200 |
      | Old Fashioned |        200 |
      | Negroni       |        200 |

  #	This Scenario checks for null response when we search for drinks that's not in the DB
  Scenario Outline: If the cocktail does not exist in the cocktail DB, the API shall return drinks as null
    When User search for cocktail input "<Drinks>"
    Then User should be able to search for cocktail status code "<StatusCode>"
    Then "<Result>" searched should return null

    Examples: 
      | Drinks    | StatusCode | Result |
      | Margariii |        200 | drinks |

  #	This Scenario checks and verifies who case insensitive searches
  Scenario Outline: Searching for a cocktail by name is case-insensitive
    Given User search for cocktail input "<Drinks>"
    Then User should be able to search for cocktail status code "<StatusCode>"
    Then User search for cocktail input "<drinks>"
    Then User should be able to search for cocktail status code "<StatusCode>"
    Then Two searches should be the same "<Drinks>" "<drinks>"

    Examples: 
      | Drinks    | StatusCode | drinks    | StatusCode | Drinks    | drinks    |
      | Margarita |        200 | margarita |        200 | Margarita | margarita |

  #	This Scenario checks for the returned body in a search and verifies defferent params we are checking for cocktails return based on index of the cocktail in the JSONArray.
  Scenario Outline: API response must contain the certain Schema properties
    Given User search for cocktail input "<Drinks>"
    Then User should be able to search for cocktail status code "<StatusCode>"
    Then "<cocktailByIndex>" response should contain "<param>" that is "<type>"

    Examples: 
      | Drinks    | StatusCode | cocktailByIndex | param                       | type   |
      | Margarita |        200 |               0 | strDrink                    | String |
      | Margarita |        200 |               0 | strTags                     | String |
      | Margarita |        200 |               0 | strCategory                 | String |
      | Margarita |        200 |               0 | strAlcoholic                | String |
      | Margarita |        200 |               0 | strGlass                    | String |
      | Margarita |        200 |               0 | strCreativeCommonsConfirmed | String |
      | Margarita |        200 |               0 | dateModified                | String |

  # This Scenario checks if we can search by ingredients by checking for status code
  Scenario Outline: The system shall include a method to search by ingredient name
    When User search for ingredient input "<Ingredient>"
    Then User should be able to search for ingredient status code "<StatusCode>"

    Examples: 
      | Ingredient | StatusCode |
      | Vodka      |        200 |
      | Gin        |        200 |
      | Whiskey    |        200 |

  # This Scenario checks for certain param and the type it is returning for the ingredient we search for
  Scenario Outline: The system shall include a method to search by ingredient name and return following field
    When User search for ingredient input "<Ingredient>"
    Then User should be able to search for ingredient status code "<StatusCode>"
    Then "<IngredientByIndex>" response should contain "<Field>" that is "<Type>"

    Examples: 
      | Ingredient | StatusCode | IngredientByIndex | Field          | Type   |
      | Vodka      |        200 |                 0 | idIngredient   | String |
      | Gin        |        200 |                 0 | strType        | String |
      | Whiskey    |        200 |                 0 | strDescription | String |

  #	This Scenario checks for strAlchohol = "No" and checks for null ABV
  Scenario Outline: If an ingredient is non-alcoholic, Alcohol is null and ABV is null
    When User search for ingredient input "<Ingredient>"
    Then User should be able to search for ingredient status code "<StatusCode>"
    Then "<IngredientByIndex>" response should contain "<Field>" that is "<Type>"
    Then If "<Field>" returns no "<ABV>" should return null

    Examples: 
      | Ingredient | StatusCode | IngredientByIndex | Field      | Type   | ABV |
      | water      |        200 |                 0 | strAlcohol | String | ABV |
      | water      |        200 |                 0 | strAlcohol | String | ABV |
      | water      |        200 |                 0 | strAlcohol | String | ABV |

  #	This Scenario checks for strAlchohol = "Yes" and checks ABV
  Scenario Outline: If an ingredient is non-alcoholic, Alcohol is null and ABV is null
    When User search for ingredient input "<Ingredient>"
    Then User should be able to search for ingredient status code "<StatusCode>"
    Then "<IngredientByIndex>" response should contain "<Field>" that is "<Type>"
    Then If "<Field>" returns yes "<ABV>" should return "<Type>"

    Examples: 
      | Ingredient | StatusCode | IngredientByIndex | Field      | Type   | ABV |
      | Vodka      |        200 |                 0 | strAlcohol | String | ABV |
      | Whiskey    |        200 |                 0 | strAlcohol | String | ABV |
      | Gin        |        200 |                 0 | strAlcohol | String | ABV |

  #				Write two additional test cases that are not covered by the requirements below.
  #	This Scenario should return all possible related cocktail when searching for one cocktail
  Scenario Outline: Search returns all cocktail in search
    Given User search for cocktail input "<Drinks>"
    Then User should be able to search for cocktail status code "<StatusCode>"
    Then "<Search>" should return all related drinks "<Param>"

    Examples: 
      | Drinks    | StatusCode | Search | Param    |
      | Margarita |        200 | drinks | strDrink |
      | Margarita |        200 | drinks | strDrink |
      | Margarita |        200 | drinks | strDrink |
      | Margarita |        200 | drinks | strDrink |

  #	This Scenario should return all cocktail by first letter
  Scenario Outline: Search returns all cocktail in search by first Letter
    Given User search for cocktail input "<firstLetter>"
    Then User should be able to search for cocktail status code "<StatusCode>"
    Then "<Search>" should return all related drinks "<Param>"

    Examples: 
      | firstLetter | StatusCode | Search | Param    |
      | a           |        200 | drinks | strDrink |
      | d           |        200 | drinks | strDrink |
      | m           |        200 | drinks | strDrink |
      | p           |        200 | drinks | strDrink |
