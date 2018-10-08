require 'oystercard.rb'

describe Oystercard do
  it 'balance is equal to 0' do
    expect(subject.balance).to eq 0
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