require 'rspec'

require 'pathname'
spec = Pathname.new( File.dirname(__FILE__) )

require spec.join("../lib/poker_dice")

Dir[ spec.join("support/**/*.rb") ].each do |helper|
  require helper
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :defined # keep things nice and predictable for folks just getting started

  config.include SpecHelpers
end
