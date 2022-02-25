require_relative 'spec_helper'

RSpec.describe PokerDice::Card do

  def new_cards(glyphs)
    described_class.cards_from_glyphs(glyphs)
  end

  def new_card(glyph)
    described_class.new(glyph)
  end

  specify ".cards_from_glyphs takes a (space delimited) string of glyphs and answers with instances" do
    cards = described_class.cards_from_glyphs("A K Q J T 9")
    expect( cards.length            ).to eq( 6 )
    expect( cards.map(&:class).uniq ).to eq( [described_class] )
  end

  specify "only 'AKQJT9' are valid glyphs" do
    expect { new_card("Y") }.to raise_error(ArgumentError)
  end

  specify "#glyph answers with the #glyph used to construct it" do
    expect( new_card("A").glyph ).to eq( "A" )
    expect( new_card("J").glyph ).to eq( "J" )
  end

  it "has a #name that depends on the glyph passed in" do
    expect( new_card("A").name ).to eq( "Ace" )
    expect( new_card("T").name ).to eq( "Ten" )
    expect( new_card("9").name ).to eq( "Nine" )
  end

  it "has a #value that depends on the glyph passed in" do
    expect( new_card("A").value ).to eq( 14 )
    expect( new_card("T").value ).to eq( 10 )
    expect( new_card("9").value ).to eq( 9 )
  end

  specify "instances are #== if they represent the same card" do
    q1 = new_card("Q") ; q2 = new_card("Q")
    expect( q1 ).to eq( q2 )
    expect( q2 ).to eq( q1 )
  end

  specify "instances are Comparable" do
    cards = new_cards("A K Q J T 9")
    sorted = cards.sort

    expect( cards.map(&:glyph)  ).to eq(%w[ A K Q J T 9 ])
    expect( sorted.map(&:glyph) ).to eq(%w[ 9 T J Q K A ])
  end

end
