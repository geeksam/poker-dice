module PokerDice
end

lib = Pathname.new(File.dirname(__FILE__))
lib.join("poker_dice").glob("*.rb") do |e|
  relname = "poker_dice/" + File.basename(e, '.rb')
  require_relative relname
end
