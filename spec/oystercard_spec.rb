require 'oystercard.rb'

describe Oystercard do
  it 'balance is equal to 0' do
    expect(subject.balance).to eq 0
  end
end