class Oystercard
  
  MAXIMUM_BALANCE = 90
  
  def initialize
    @balance = 0
  end
  attr_reader :balance
  
  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end
end
