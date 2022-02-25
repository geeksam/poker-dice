require_relative 'spec_helper'

RSpec.describe PokerDice::Hand do

  describe "Scoring hands" do
    specify "bust" do
      expect( "A K Q J 9" ).to score_as( :busted? )
    end

    specify "one pair" do
      expect( "T K Q 9 T" ).to score_as( :one_pair? )
    end

    specify "two pair" do
      expect( "Q Q 9 A 9" ).to score_as( :two_pair? )
    end

    specify "three of a kind" do
      expect( "9 9 K J 9" ).to score_as( :three_of_a_kind? )
    end

    specify "straight" do
      expect( "A K Q J T" ).to score_as( :straight? )
    end

    specify "full house" do
      expect( "K K 9 K 9" ).to score_as( :full_house? )
    end

    specify "four of a kind" do
      expect( "T T T A T" ).to score_as( :four_of_a_kind? )
    end

    specify "five of a kind" do
      expect( "J J J J J" ).to score_as( :five_of_a_kind? )
    end
  end



  ########################################################################################
  ########################################################################################



  describe "rolling dice" do
    let(:expected_range) { %w[ 9 T J Q K A ] }
=begin

    specify "returns a string representing a card from nine to ace" do
      rolled = described_class.roll_die
      expect( expected_range ).to include( rolled )
    end

    specify "does the above, but randomly" do
      rolled = 100.times.map { described_class.roll_die }
      expect( rolled.uniq.sort ).to eq( expected_range.sort )
    end
=end
  end

  describe "rerolling dice in a hand" do
=begin
    specify "Constructing a Hand with '*' cards returns a new Hand with random dice" do
      allow( described_class ).to receive( :roll_die ).and_return( "Q" ).once

      hand1 = described_class.new( "J J Q Q *" ) # the asterisk means '(re)roll'
      expect( hand1 ).to score_as( :full_house? )
    end

    specify "up to five dice can be rerolled" do
      allow( described_class ).to receive( :roll_die ).and_return( "T", "J", "Q", "K", "A" )

      hand1 = described_class.new( "* * * * *" ) # oh, look, a cron job!
      expect( hand1 ).to score_as( :straight? )
    end
=end
  end

  describe "Comparing hands" do
    describe "of different ranks" do
      specify "bust < one pair" do
        expect( "9 J Q K A" ).to score_below( "9 T T Q K" )
      end

=begin
      specify "two pair > one pair" do
        expect( "9 9 Q Q A" ).to score_above( "9 T T Q K" )
      end

      specify "two pair < three of a kind" do
        expect( "9 9 Q Q A" ).to score_below( "9 9 9 J K" )
      end

      specify "three of a kind < straight" do
        expect( "9 9 9 J K" ).to score_below( "T J Q K A" )
      end

      specify "full house > straight" do
        expect( "9 9 Q Q Q" ).to score_above( "T J Q K A" )
      end

      specify "full house < four of a kind" do
        expect( "K K A A A" ).to score_below( "9 Q Q Q Q" )
      end

      specify "four of a kind > straight" do
        expect( "T T T T A" ).to score_above( "T J Q K A" )
      end

      specify "five of a kind > four of a kind" do
        expect( "J J J J J" ).to score_above( "9 A A A A" )
      end
=end
    end

    describe "within the same rank" do
=begin
      specify "one pair" do
        expect( "T T J Q A" ).to score_below( "9 T J J K" )
      end

      specify "two pair, no match" do
        expect( "9 9 T A A" ).to score_above( "T T Q Q K" )
      end

      specify "two pair, highs match" do
        expect( "T Q Q A A" ).to score_above( "T T Q A A" )
      end

      specify "three of a kind" do
        expect( "9 T J J J" ).to score_above( "9 9 9 J A" )
      end

      specify "straight" do
        expect( "9 T J Q K" ).to score_below( "T J Q K A" )
      end

      specify "full house, no match" do
        expect( "T T J J J" ).to score_below( "9 9 Q Q Q" )
      end

      specify "full house, twos match" do
        expect( "J J A A A" ).to score_above( "J J Q Q Q" )
      end

      specify "full house, threes match" do
        expect( "Q Q J J J" ).to score_above( "T T J J J" )
      end

      specify "four of a kind" do
        expect( "9 Q Q Q Q" ).to score_below( "Q A A A A" )
      end

      specify "five of a kind" do
        expect( "J J J J J" ).to score_below( "A A A A A" )
      end
=end
    end

    describe "ties can be broken by the highest non-matching die that doesn't participate in the rank, if there is one" do
=begin
      specify "one pair" do
        expect( "T T J Q A" ).to score_below( "T T Q K A" )
      end

      specify "two pair" do
        expect( "9 9 T A A" ).to score_below( "9 9 Q A A" )
      end

      specify "three of a kind" do
        expect( "9 J J J Q" ).to score_above( "9 T J J J" )
      end

      specify "four of a kind" do
        expect( "9 Q Q Q Q" ).to score_below( "Q Q Q Q K" )
      end
=end
    end
  end

end
