require 'minitest/autorun'
require 'minitest/pride'
require 'liner'


# create some dummy classes to test against with each of the supported usages.

Beer = Liner.new :hops, :yeast

class Pizza < Liner.new(:crust, :sauce)
end

class Burger
  liner :bun, :meat, :cheese
end
