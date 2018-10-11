class Oystercard
  
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  
  def initialize
    @balance = 0
    @journeys = []
  end
  attr_reader :balance, :entry_station, :exit_station, :journeys
  
  def touch_in(station)
    fail "A minimum balance of £#{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    @entry_station = station
  end
  
  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @exit_station = station
    @journeys << {entry_station: entry_station, exit_station: exit_station}
    @entry_station = nil
  end
  
  def in_journey?
    !!entry_station
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
