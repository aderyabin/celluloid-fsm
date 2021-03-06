class TestMachine
  include Celluloid::FSM

  def initialize
    super
    @fired = false
  end

  state :callbacked do
    @fired = true
  end

  state :pre_done, to: :done
  state :another, :done

  def fired?
    @fired
  end
end

class CustomDefaultMachine
  include Celluloid::FSM

  default_state :foobar
end

class OptionDefaultTestMachine
  include Celluloid::FSM

  state :foobar, default: true
end

class ComplexTextMachine
  include Celluloid::FSM

  default_state :fired do
    @fired = true
  end

  def fired?
    @fired
  end
end

class AnotherCustomDefaultMachine
  include Celluloid::FSM

  state :foo, default: true
  state :bar
end
