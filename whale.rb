module Animal
  module Mammal
    def lay_eggs?
      false
    end
  end
end

class Whale
  include Animal::Mammal
end

class SouthernRightWhale < Whale
  def endangered?
    true
  end
end

require 'irb'; IRB.start