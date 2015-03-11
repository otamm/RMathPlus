[![Gem Version](https://badge.fury.io/rb/glasses.svg)](http://badge.fury.io/rb/glasses) 
# Rmathplus

A gem designed due to my personal online puzzle solving habits; some of them may be a part
of Ruby's kernel already, the purpose of the gem is to unite some methods in a single place with easy
access to them. RMathPlus is a collection of methods that appear kinda often in puzzles, and also some
that do not show up that often but can clearly be reused. Designed with computational efficiency in mind,
some of the methods are interdependent and therefore it is a good idea to always load the whole gem instead
of requiring specific methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'r_math_plus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rmathplus

## Usage
The '.is_prime?' method is the base of all of the other methods and also available by itself.
Simple pass a number as a parameter and it will return a boolean value:
```ruby
RMathPlus.is_prime?(3) # => true
RMathPlus.is_prime?(4) # => false
```
The method also accepts an optional second parameter, an array containing prime numbers;
usage of the second parameter works best in an incrementing fashion (see this repo's lib/r_math_plus.rb '#prime_array' method for an example.)
Ex:
```ruby
RMathPlus.is_prime?(5,[2,3]) # => true, faster execution
RMathPlus.is_prime?(8,[2,3,5,7]) # => false, faster execution
```

The '.prime_array' method takes an integer as a parameter and returns an array with the primes lesser than or equal to the number:
```ruby
RMathPlus.prime_array(10) # => [2,3,5,7]
```

'.nth_prime' returns the first 'n' primes passed as a parameter to the method:
```ruby
RMathPlus.nth_prime(3) # => [2,3,5]
```

'.prime_factors' returns an array of the prime factors of a given number n. If n is a prime, it will return n.
Ex:
```ruby
RMathPlus.prime_factors(10) # => [2,5]
RMathPlus.prime_factors(8)  # => [2,2,2]
```

Second optional parameter used in order to improve speed if the method will run through an array of
integers; its input should be the array returned by the '.prime_array' method with the array of numbers' biggest int as parameter.
Ex:
```ruby
biggest_number_prime_array = RMathPlus.prime_array(10)
prime_factors = []
[2,4,6,7,9,10].each do |n|
  prime_factors.push(RMathPlus.prime_factors(n,biggest_number_prime_array)) # will execute faster iterating through a single array, otherwise it would make a prime array for each of the numbers
end
# => prime_factors == [[2],[2,2],[2,3],[7],[3,3],[2,5]]
```

'.lcm' is used to calculate the least common multiple of a given array of numbers. Dependent on the method above, the code on lib/r_math_plus.rb which defines
this method illustrates well an example of the use of the optional second parameter to the '.prime_factors' method above.
```ruby
RMathPlus.lcm([2,4,8]) # => 8
RMathPlus.lcm([3,6,8]) # => 24
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/rmathplus/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
