# Liner

Lay a liner for your basic Ruby classes. Basically, it's a solid foundation for a PORO (Plain Old Ruby Object). A Liner is something like a more flexible Struct or a less magical OpenStruct, with a focus on enhanced inheritablity.

## Usage

```ruby
# Let your class inherit from Liner and specify your attributes
class Engine < Liner.new(:name, :fuel)
end

# Then you get a hash based initializer and a nice inspector:
e = Engine.new(name: 'V8', fuel: "gasoline") # => #<Engine name="V8",
fuel="gasoline">

# Attribute getters and setters are built in
e.fuel # => "gasoline"
e.fuel = "diesel" # => "diesel"

# Attributes are accessible via hash-style lookup too
e[:name] # => "V8"
e[:name] = "V6" # => "V6"
e[:foo] = "Bar" # => ArgumentError: Invalid liner attribute: 'foo'
```

## Installation

Add this line to your application's Gemfile:

    gem 'liner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install liner



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
