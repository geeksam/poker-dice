require 'forwardable'

module PokerDice
  class Card

    CardFact = Struct.new(:glyph, :name, :value)

    FACTS = [
      CardFact.new( "9", "Nine",   9, ),
      CardFact.new( "T", "Ten",   10, ),
      CardFact.new( "J", "Jack",  11, ),
      CardFact.new( "Q", "Queen", 12, ),
      CardFact.new( "K", "King",  13, ),
      CardFact.new( "A", "Ace",   14, ),
    ]
    FACTS_BY_GLYPH = Hash[ FACTS.map { |e| [ e.glyph, e ] } ]



    def self.cards_from_glyphs(glyphs)
      glyphs.to_s.strip.split(/\s+/).map { |e| new(e) }
    end



    attr_reader :fact
    def initialize(glyph)
      @fact = FACTS_BY_GLYPH.fetch(glyph.upcase) {
        raise ArgumentError, "#{glyph.inspect} is not a valid card glyph!"
      }
    end

    def to_s
      fact.glyph
    end

    def inspect
      "#{glyph}"
    end



    extend Forwardable
    def_delegators :fact, :glyph, :name, :value

    include Comparable
    def <=>(other)
      value <=> other.value
    end

  end
end
