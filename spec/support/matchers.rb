RSpec::Matchers.define :score_as do |expected|
  match do |actual|
    hand = \
      case actual
      when String          ; PokerDice::Hand.new( actual )
      when PokerDice::Hand ; actual
      else raise ArgumentError, "Unsure how to score #{actual.inspect}"
      end

    hand.respond_to?(expected) && positives_for( hand ) == [ expected ]
  end

  failure_message do |actual|
    hand = PokerDice::Hand.new( actual )
    positives = positives_for( hand )
    false_positives = positives - [ expected ]

    msg = "PokerDice::Hand with #{actual.inspect}"

    case
    when positives.include?( expected )
      msg << "\n+ correctly scored as #{expected.inspect}"
    when !hand.respond_to?( expected )
      msg << "\n- does not respond to #{expected.inspect}"
    else
      msg << "\n- did not score as #{expected.inspect}"
    end

    if false_positives.any?
      msg << "\n- incorrectly scored as:"
      false_positives.each do |nope|
        msg << "\n  - " + nope.inspect
      end
    end

    msg
  end

  def positives_for(hand)
    PokerDice::Hand.scoring_messages.select { |msg| hand.respond_to?(msg) && hand.send( msg ) }
  end
end

RSpec::Matchers.define :score_above do |expected|
  match do |actual|
    compare_hands( actual, expected ) == :above
  end

  failure_message do |actual|
    msg = "Expected #{actual.inspect} to score higher than #{expected.inspect}"

    case compare_hands( actual, expected )
    when :equal        ; msg + "\n- scored the same"
    when :below        ; msg + "\n- scored lower"
    when :cant_compare ; msg + "\n- the hands could not be compared"
    end
  end
end

RSpec::Matchers.define :score_below do |expected|
  match do |actual|
    compare_hands( actual, expected ) == :below
  end

  failure_message do |actual|
    msg = "Expected #{actual.inspect} to score lower than #{expected.inspect}"

    case compare_hands( actual, expected )
    when :equal        ; msg + "\n- scored the same"
    when :above        ; msg + "\n- scored higher"
    when :cant_compare ; msg + "\n- the hands could not be compared"
    end
  end
end

RSpec::Matchers.define :tie_with do |expected|
  match do |actual|
    compare_hands( actual, expected ) == :equal
  end

  failure_message do |actual|
    msg = "Expected #{actual.inspect} to tie with #{expected.inspect}"

    case compare_hands( actual, expected )
    when :below        ; msg + "\n- scored lower"
    when :above        ; msg + "\n- scored higher"
    when :cant_compare ; msg + "\n- the hands could not be compared"
    end
  end
end
