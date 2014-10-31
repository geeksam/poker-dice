Feature: Playing a round

  Source:  http://boardgames.about.com/od/pokerdice/a/poker_dice_rules.htm

  Each player has three rolls.  On the first roll, she rolls all five
  dice.  She may then set aside any number of dice (including zero) and
  re-roll the remainder.

  After the second roll, she may once again set aside any number of dice
  and re-roll the remainder.

  Once dice are set aside, they may not be re-rolled.  A player is not
  required to make a second or third roll.

  Scenario: 
    * Player 1 rolls J J Q Q K (two pair)
    * Player 2 rolls 9 9 T K A (one pair)
    * Player 1 rerolls die #5, getting J J Q Q Q (full house)
    * Player 2 rerolls dice 3-5, getting 9 9 J Q K (one pair)
    * Player 1 stands
    * Player 2 rerolls dice 3-5, getting 9 9 9 J A (three of a kind)
    * Player 1 is the winner
