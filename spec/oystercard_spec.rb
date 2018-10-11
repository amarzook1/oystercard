require 'oystercard.rb'

describe Oystercard do
  
  let(:entry_station){ double :entry_station }
  let(:exit_station){double :exit_station}
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
  
  it 'balance is equal to 0' do
    expect(subject.balance).to eq 0
  end
  
  it 'respond to touch_in' do
    expect(subject).to respond_to(:touch_in).with(1).argument
  end
  
  it 'respond to in_journey?' do
    expect(subject).to respond_to(:in_journey?)
  end
  
  it 'responds to touch_out' do
    expect(subject).to respond_to(:touch_out).with(1).argument
  end
  
  describe '#touch_out' do
    let(:minimum_balance) {Oystercard::MINIMUM_BALANCE}
    it 'journey is false when touch_out' do
      subject.top_up(1)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
    
    it 'returns new balance after touch out' do
      subject.top_up(2)
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by (-minimum_balance)
    end
    
    it 'has an empty list of journeys by default' do
      expect(subject.journeys).to be_empty
    end
    
    it 'outputs nil for entry station' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end
  end
  describe '#journeys' do
    it 'stores a journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
    
  end
  describe '#touch_in' do
    it 'journey is true when touch in' do
      subject.top_up(1)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end
    it 'cant touch in with if below minimum balance' do
      minimum_balance = Oystercard::MINIMUM_BALANCE
      expect{subject.touch_in(entry_station)}.to raise_error "A minimum balance of £#{minimum_balance}"
    end
    
    it 'stores the entry station' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
  end
  
  describe '#top_up' do
    it { expect(subject).to respond_to(:top_up).with(1).arguments }
    
    it 'can top up the balance' do
      expect{ subject.top_up 50 }.to change{ subject.balance }.by 50
    end
    
    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end
end
