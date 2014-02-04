# Liner

Lay a liner for your Ruby classes. Liner is designed to enhance simple classes
with some common idioms and stay out of your way.

## Usage

You can setup a Liner based class in any of these equivalent ways:

```ruby
Engine = Liner.new(:layout, :fuel)
```

```ruby
class Engine < Liner.new(:layout, :fuel)
end
```
```ruby
class Engine
  liner :layout, :fuel
end
```

Your new class comes with an initializer that takes values in the order you
defined them.
```ruby
e = Engine.new('V6', 'gasoline')
# => #<Engine layout="V6", fuel="gasoline">
```
Or, you can initialize with a hash if you prefer.
```ruby
e = Engine.new(layout: 'V8', fuel: "gasoline")
# => #<Engine layout="V8", fuel="gasoline">
```

Attribute getters and setters are built in.
```ruby
e.fuel            # => "gasoline"
e.fuel = "diesel" # => "diesel"
```

Attributes are accessible via hash style lookup too.
```ruby
e[:layout]        # => "V8"
e[:layout] = "V6" # => "V6"
e[:foo] = "Bar"   # => ArgumentError: Invalid liner attribute: 'foo'
```

Equality methods are also availble.
```ruby
e.eql? Engine.new(layout: 'I4')               # => false
e == Engine.new(layout: 'V6', fuel: 'diesel') # => true
```

If you want an attribute hash, we have that.

```ruby
e.to_hash # => { :layout => 'V6', :fuel => 'diesel' }
```

If you want to customize the way an attribute is read, just override the method
like you would any accessor. You can access the raw value through either the instance variable,
`read_attribute`, or `super`.

```ruby
class Taco < Liner.new(:filling)
  def filling
    if read_liner(:filling) == 'ground beef'
      'Steak'
    elsif @filling == 'unknown fish'
      'Atlantic Cod'
    else
      super()
    end
  end
end
```

Overridden getters will take precedence for the other features. This
is probably desirable, just don't be surprised by it.

```ruby
taco = Taco.new("ground beef")
# => #<Taco filling="Steak">
taco[:filling] = 'unknown fish'
# => 'unknown fish'
taco.hash
# => {:filling=>"Atlantic Cod"}
```

It's the same scenario for customizing the writer. Set the real value
through the instance variable, `write_attribute`, or `super`.

```ruby
class Bacon < Liner.new(:is_good)
  def is_good=(good)
    @is_good = true
  end
end
```

Again, the overridden method takes precendence, even with writers (like
`taco[:is_good] = false`).



```ruby
generic_bacon = Bacon.new
generic_bacon[:is_good] = false
# => true
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
