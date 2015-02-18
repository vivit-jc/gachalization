Feature: Attacking a monster
  Background:
    Given there is a country

  Scenario: attack the monster
    When I attack it
    Then it should die