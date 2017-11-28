class BusStop

attr_reader :name, :queue

  def initialize(name)
    @name = name
    @queue = []
  end

  def add_to_queue(new_passenger)
    @queue.push(new_passenger)
  end

end
