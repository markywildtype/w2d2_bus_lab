require("minitest/autorun")
require("minitest/rg")
require_relative("../bus.rb")
require_relative("../person.rb")
require_relative("../bus_stop.rb")

class TestBus < Minitest::Test

  def setup
    @bus1 = Bus.new("22", "Gyle Centre")
    @person1 = Person.new("Mark", 22)
    @person2 = Person.new("Jon Ronson", 47)
    @kirkhill = BusStop.new("Kirkhill")
    @carcassone = BusStop.new("Carcassone")
    @french_dude = Person.new("Francois", 98)
    @french_lady = Person.new("Madamoiselle Shelle", 0)
  end

  def test_bus_route_number
    assert_equal(22, @bus1.route_number())
  end

  def test_drive
    assert_equal("Brum brum!", @bus1.drive())
  end

  def test_passengers
    assert_equal([], @bus1.passengers)
  end

  def test_number_of_passengers
    assert_equal(0, @bus1.number_of_passengers)
  end

  def test_bus_pick_up
    @bus1.pick_up(@person1)
    assert_equal([@person1],@bus1.passengers)
  end

  def test_drop_off
    @bus1.pick_up(@person1)
    @bus1.pick_up(@person2)
    @bus1.drop_off(@person2)
    assert_equal([@person1], @bus1.passengers)
  end

  def test_break_down
    @bus1.pick_up(@person1)
    @bus1.pick_up(@person2)
    @bus1.break_down()
    assert_equal([], @bus1.passengers)
  end

  def test_pick_up_from_stop
    @kirkhill.add_to_queue(@person1)
    @kirkhill.add_to_queue(@person2)
    @bus1.pick_all_up_from(@kirkhill)
    assert_equal(2, @bus1.number_of_passengers)
    assert_equal([], @kirkhill.queue())
  end

  def test_pick_up_more_folk
    @carcassone.add_to_queue(@french_dude)
    @carcassone.add_to_queue(@french_lady)
    @kirkhill.add_to_queue(@person1)
    @kirkhill.add_to_queue(@person2)
    @bus1.pick_up(@person1)
    @bus1.pick_all_up_from(@carcassone)
    assert_equal(3, @bus1.number_of_passengers)
    assert_equal([], @carcassone.queue())
  end



end
