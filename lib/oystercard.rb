class Oystercard
  
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  
  def initialize
    @balance = 0
    @journey = false
  end
  attr_reader :balance, :entry_station
  
  def touch_in(station)
    fail "A minimum balance of £#{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    @journey = true
    @entry_station = station
  end
  
  def touch_out
    @journey = false
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
  end
  
  def in_journey?
    @journey
  end
  
  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end
  
  private
  def deduct(amount)
      @balance -= amount
  end
  
end
