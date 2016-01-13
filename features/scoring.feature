Feature: Scoring hands of poker dice

  For the purposes of these scenarios, a "poker dice" is just some way of
  randomly selecting a value that corresponds to a card in the game of
  poker.  Six-sided dice are used so that the game can be played with
  any dice; the values are translated as follows:

  1 - 9 (Nine)
  2 - T (Ten)
  3 - J (Jack)
  4 - Q (Queen)
  5 - K (King)
  6 - A (Ace)

  Ace is considered the highest card.

  (There are no suits or colors in poker dice.)

  Scenario: Bust
    Given the hand: A K Q J 9
    Then the hand is a bust

  Scenario: One pair
    Given the hand: T K Q 9 T
    Then the hand has one pair

  Scenario: Two pair
    Given the hand: Q Q 9 A 9
    Then the hand has two pair

  Scenario: Three of a kind
    Given the hand: 9 9 K J 9
    Then the hand has three of a kind

  Scenario: Straight
    Given the hand: A K Q J T
    Then the hand has a straight

  Scenario: Full house
    Given the hand: K K 9 K 9
    Then the hand is a full house

  Scenario: Four of a kind
    Given the hand: T T T A T
    Then the hand has four of a kind

  Scenario: Five of a kind
    Given the hand: J J J J J
    Then the hand has five of a kind

