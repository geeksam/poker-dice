module PokerDice
  class Hand
    attr_reader :cards
    def initialize(glyphs)
      @cards = Card.cards_from_glyphs(glyphs).sort
    end

    # These are in a module for the convenience of magical RSpec matchers
    #
    # NOTE:  the matcher is picky about these categories being mutually exclusive!
    module ScoringMethods
      def busted?
        set_sizes == { 1 => 5 } && !straight?
      end

      def one_pair?
        set_sizes == { 2 => 1, 1 => 3 }
      end

      def two_pair?
        set_sizes == { 2 => 2, 1 => 1 }
      end

      def three_of_a_kind?
        set_sizes == { 3 => 1, 1 => 2 }
      end

      def four_of_a_kind?
        set_sizes == { 4 => 1, 1 => 1 }
      end

      def five_of_a_kind?
        set_sizes == { 5 => 1 }
      end

      def straight?
        cards.each_cons(2).all? { |a,b| (b.value - a.value) == 1 }
      end

      def full_house?
        set_sizes[3] == 1 && set_sizes[2] == 1
      end
    end
    include ScoringMethods

    private

    def counts
      # NOTE: one could use :value or :fact, but :glyph makes it easier to
      # inspect when debugging :)
      @_counts ||= counts_by( cards, :glyph )
    end

    def set_sizes
      @_set_sizes ||= counts_by( counts, :last )
    end

    def counts_by(list, method)
      Hash[ list.group_by(&method).map {|x,xs| [ x, xs.length ] } ]
    end



    # This is also for the magical RSpec matchers.  Please ignore it.
    def self.scoring_messages
      ScoringMethods.instance_methods
    end
  end
end
