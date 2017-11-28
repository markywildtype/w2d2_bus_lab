class Bus

attr_reader :route_number, :passengers

  def initialize(route_number, destination)
    @route_number = route_number.to_i
    @destination = destination
    @passengers = []
  end

  def drive
    return "Brum brum!"
  end

  def number_of_passengers
    return @passengers.length
  end

  def pick_up(passenger)
    @passengers << passenger
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def break_down()
    @passengers.clear()
    # @passengers = []
  end

  def pick_all_up_from(bus_stop)
    passengers_at_stop = bus_stop.queue()
    @passengers.concat(bus_stop.queue())
    passengers_at_stop.clear()
  end
end
