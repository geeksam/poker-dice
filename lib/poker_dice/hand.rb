module PokerDice
  class Hand
    def initialize(*)
    end

    # These are in a module for the convenience of magical RSpec matchers
    module ScoringMethods
      def busted?
      end
    end
    include ScoringMethods

    # This is also for the magical RSpec matchers.  Please ignore it.
    def self.scoring_messages
      ScoringMethods.instance_methods
    end
  end
end
