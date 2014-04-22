class Pony
  attr_writer :name
  attr_reader :riders
  attr_accessor :rounds

  def initialize
  end

  def say_hello
  end
end

pony = Pony.new
pony.name = 'Thunder'
pony.rounds # => 4
pony.riders += 1
pony.riders # => Undefined method
pony.say_hello