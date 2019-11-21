module PokerDice
  class Hand
    def initialize(*)
    end

    # These are in a module for the convenience of magical RSpec matchers
    module ScoringMethods
      def busted?
      end

      def one_pair?
      end

      def two_pair?
      end

      def three_of_a_kind?
      end

      def four_of_a_kind?
      end

      def five_of_a_kind?
      end

      def straight?
      end

      def full_house?
      end
    end
    include ScoringMethods

    # This is also for the magical RSpec matchers.  Please ignore it.
    def self.scoring_messages
      ScoringMethods.instance_methods
    end
  end
end
