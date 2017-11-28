require("minitest/autorun")
require("minitest/rg")
require_relative("../person.rb")

class TestPerson < Minitest::Test

  def setup
    @person1 = Person.new("Amy", "25")
  end

  def test_person_name
    assert_equal("Amy", @person1.name())
  end

end
