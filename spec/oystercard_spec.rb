require 'oystercard.rb'

describe Oystercard do
  it 'balance is equal to 0' do
    expect(subject.balance).to eq 0
  end
  
  describe '#top_up' do
      it 'responds to top up' do
         expect(subject).to respond_to(:top_up).with(1).arguments
      end
  end
end