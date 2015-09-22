require "celluloid/rspec"
require "celluloid/fsm"

Dir[ *Specs::INCLUDE_PATHS ].map { |f| require f }
