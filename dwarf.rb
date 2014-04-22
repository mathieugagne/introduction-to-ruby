# dwarf.rb
class Dwarf
  include Comparable

  def initialize(name, age, beard_strength)
    @name           = name
    @age            = age
    @beard_strength = beard_strength
  end

  attr_reader :name, :age, :beard_strength
  public    :name
  private   :age
  protected :beard_strength

  # Comparable module will use this comparison method for >, <, ==, etc.
  def <=>(other_dwarf)
    # One dwarf is allowed to call this method on another
    beard_strength <=> other_dwarf.beard_strength
  end

  def greet
    "Lo, I am #{name}, and have mined these #{age} years.\
       My beard is #{beard_strength} strong!"
  end

  def blurt
    # Not allowed to do this: private methods can't have an explicit receiver
    "My age is #{self.age}!"
  end
end

require 'irb'; IRB.start