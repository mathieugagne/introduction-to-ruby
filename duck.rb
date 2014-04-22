# duck.rb
class Duck

  def quack
    puts 'Quack!'
  end

  def method_missing(meth, *args, &block)
    if [:meow, :bark, :roar, :moo, :laugh].include?(meth)
      puts "A duck can't #{meth}."
    else
      super
    end
  end
end

require 'irb'; IRB.start

