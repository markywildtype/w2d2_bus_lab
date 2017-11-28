class Person

attr_reader :name

  def initialize(name, age)
    @name = name
    @age = age.to_i
  end

end
