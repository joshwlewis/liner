require 'minitest/autorun'
require 'minitest/pride'
require 'liner'


# create some dummy classes to test against with each of the supported usages.

Beer = Liner.new :hops, :yeast

class Pizza < Liner.new(:crust, :sauce)
end

Burger = Liner.new(:bun, :meat)

class Cheeseburger < Burger
  liner :cheese
end
