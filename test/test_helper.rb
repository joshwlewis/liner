require 'minitest/autorun'
require 'minitest/pride'
require 'liner'

Beer = Liner.new(:name, :description)

class Pizza < Liner.new(:crust, :sauce)
end

class Burger
  liner :type, :cheese
end
