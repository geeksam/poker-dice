require 'rspec'

require 'pathname'
spec = Pathname.new( File.dirname(__FILE__) )

require spec.join("../lib/poker_dice")

Dir[ spec.join("support/**/*.rb") ].each do |helper|
  require helper
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :defined # keep things nice and predictable for folks just getting started

  # These two settings work together to allow you to limit a spec run to
  # individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all
  # examples get run.
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.include SpecHelpers
end
