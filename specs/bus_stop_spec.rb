require("minitest/autorun")
require("minitest/rg")
require_relative("../bus_stop.rb")
require_relative("../person.rb")

class TestBusStop < Minitest::Test

  def setup
    @bus_stop1 = BusStop.new("Morningside")
    @person3 = Person.new("Begbie", 54)
  end

  def test_bus_stop_name
    assert_equal("Morningside", @bus_stop1.name)
  end

  def test_add_to_queue
    @bus_stop1.add_to_queue(@person3)
    assert_equal([@person3], @bus_stop1.queue)
  end

end
