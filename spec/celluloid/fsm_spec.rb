RSpec.describe Celluloid::FSM, actor_system: :global do
  subject { TestMachine.new }

  it "transitions between states" do
    expect(subject.state).not_to be :done
    subject.transition :done
    expect(subject.state).to be :done
  end

  it "fires callbacks for states" do
    expect(subject).not_to be_fired
    subject.transition :callbacked
    expect(subject).to be_fired
  end

  it "supports constraints on valid state transitions" do
    subject.transition :pre_done
    expect { subject.transition :another }.to raise_exception ArgumentError
  end

  context "default state" do
    it "starts on initialize" do
      expect(subject.state).to eq(TestMachine.default_state)
    end

    it "allows custom" do
      expect(CustomDefaultMachine.new.state).to be :foobar
    end

    it "allows as option" do
      expect(CustomDefaultMachine.new.state).to be :foobar
    end

    it "accepts block" do
      expect(ComplexTextMachine.new).to be_fired
    end
  end

  context ".states" do
    it "has default state" do
      expect(TestMachine.states[:default]).to_not be nil
    end
  end

  context "dynamic defined methods" do
    it 'checks state' do
      expect(AnotherCustomDefaultMachine.new.foo?).to be true
    end

    it 'set state' do
      state_machine = AnotherCustomDefaultMachine.new
      state_machine.bar!
      expect(state_machine.state).to be :bar
    end
  end

  context "with a dummy actor attached" do
    let(:delay_interval) { Specs::TIMER_QUANTUM * 10 }
    let(:sleep_interval) { delay_interval + Specs::TIMER_QUANTUM * 10 }

    let(:dummy) do
      Class.new do
        include Celluloid
      end.new
    end

    before do
      subject.attach dummy
      subject.transition :another
    end

    context "with a delayed transition" do
      before { subject.transition :done, delay: delay_interval }

      context "before delay has ended" do
        it "stays unchanged" do
          expect(subject.state).to be :another
        end
      end

      context "when delay has ended" do
        before { sleep sleep_interval }

        it "transitions to delayed state" do
          expect(subject.state).to be :done
        end
      end

      context "when another transition is made meanwhile" do
        before do
          subject.transition :pre_done
          sleep sleep_interval
        end

        it "cancels delayed state transition" do
          expect(subject.state).to be :pre_done
        end
      end
    end
  end

  context "actor is not set" do
    context "transition is delayed" do
      it "raises an unattached error" do
        expect { subject.transition :another, delay: 100 } \
          .to raise_error(Celluloid::FSM::UnattachedError)
      end
    end
  end

  context "transitioning to an invalid state" do
    it "raises an argument error" do
      expect { subject.transition :invalid_state }.to raise_error(ArgumentError)
    end

    it "should not call transition! if the state is :default" do
      expect(subject).not_to receive :transition!
      subject.transition :default
    end
  end
end
