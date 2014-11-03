Feature: Comparing hands of poker dice

  Identical hands are a "push" (this is apparently poker jargon for "tie").

  Scenario Outline: comparing hands of different ranks
    Given player 1 has hand: <Player 1 Hand>
    And player 2 has hand: <Player 2 Hand>
    Then <Winner> has the better hand
    Examples:
      | Comment                         | Player 1 Hand | Player 2 Hand | Winner   |
      | bust < one pair                 | 9 J Q K A     | 9 T T Q K     | Player 2 |
      | two pair > one pair             | 9 9 Q Q A     | 9 T T Q K     | Player 1 |
      | two pair < three of a kind      | 9 9 Q Q A     | 9 9 9 J K     | Player 2 |
      | three of a kind < straight      | 9 9 9 J K     | T J Q K A     | Player 2 |
      | full house > straight           | 9 9 Q Q Q     | T J Q K A     | Player 1 |
      | full house < four of a kind     | K K A A A     | 9 Q Q Q Q     | Player 2 |
      | four of a kind > straight       | T T T T A     | T J Q K A     | Player 1 |
      | five of a kind > four of a kind | J J J J J     | 9 A A A A     | Player 1 |

  Scenario Outline: comparing hands within the same rank
    Given player 1 has hand: <Player 1 Hand>
    And player 2 has hand: <Player 2 Hand>
    Then <Winner> has the better hand
    Examples:
      | Comment                  | Player 1 Hand | Player 2 Hand | Winner   |
      | one pair                 | T T J Q A     | 9 T J J K     | Player 2 |
      | two pair, no match       | 9 9 T A A     | T T Q Q K     | Player 1 |
      | two pair, highs match    | T Q Q A A     | T T Q A A     | Player 1 |
      | three of a kind          | 9 T J J J     | 9 9 9 J A     | Player 1 |
      | straight                 | 9 T J Q K     | T J Q K A     | Player 2 |
      | full house, no match     | T T J J J     | 9 9 Q Q Q     | Player 2 |
      | full house, twos match   | J J A A A     | J J Q Q Q     | Player 1 |
      | full house, threes match | Q Q J J J     | T T J J J     | Player 1 |
      | four of a kind           | 9 Q Q Q Q     | Q A A A A     | Player 2 |
      | five of a kind           | J J J J J     | A A A A A     | Player 2

  Scenario Outline: ties can be broken by the highest non-matching die that doesn't participate in the rank, if there is one
    Given player 1 has hand: <Player 1 Hand>
    And player 2 has hand: <Player 2 Hand>
    Then <Winner> has the better hand
    Examples:
      | Comment         | Player 1 Hand | Player 2 Hand | Winner   |
      | one pair        | T T J Q A     | T T Q K A     | Player 2 |
      | two pair        | 9 9 T A A     | 9 9 Q A A     | Player 2 |
      | three of a kind | 9 J J J Q     | 9 T J J J     | Player 1 |
      | four of a kind  | 9 Q Q Q Q     | Q Q Q Q K     | Player 2 |

