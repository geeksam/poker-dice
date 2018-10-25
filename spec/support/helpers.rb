module SpecHelpers

  def compare_hands(cards1, cards2)
    left  = PokerDice::Hand.new( cards1 )
    right = PokerDice::Hand.new( cards2 )

    return :cant_compare unless left.respond_to?( :< )
    return :cant_compare unless left.respond_to?( :== )
    return :cant_compare unless left.respond_to?( :> )

    case
    when left <  right ; :below
    when left == right ; :equal
    when left >  right ; :above
    end
  end

end
