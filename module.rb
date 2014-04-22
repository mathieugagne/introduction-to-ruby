module Animal
  module Mammel
    def lay_eggs?
      false
    end
  end
end

class Whale
  include Animal::Mammel
end

require 'irb'; IRB.start