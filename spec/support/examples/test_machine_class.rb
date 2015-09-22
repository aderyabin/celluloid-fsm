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
