# Math24
[![CircleCI](https://circleci.com/gh/randallreedjr/math24/tree/master.svg?style=svg)](https://circleci.com/gh/randallreedjr/math24/tree/master)
[![Gem Version](https://badge.fury.io/rb/math24.svg)](https://badge.fury.io/rb/math24)

Math24 is a gem providing functionality to play the base version of the Math 24
 game. In the base version of Math 24, a player must combine 4 integers, using
 addition (+), subtraction (-), multiplication (\*), or division (/) to reach 24.
 Extensions to the game included fraction, decimals, exponents, and other
 mathematical functions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'math24', '~>2.0.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install math24

*Note that the `< 2.0.0` version of the gem is deprecated.*

## Usage

As of version `2.0.0`, the interactive CLI version of the game has been removed.

### Generate a Math 24 problem

Generate a Math 24 problem. This method will return an array of four integers,
guaranteed to be a solvable Math 24 problem.

```
Math24.generate_problem
```

### Check a solution

Verify a potential solution for the given problem. The problem should be passed
as an array of four integers, while the solution should be a string. This
method will return true if the solution is valid, and false otherwise.

```
Math24.check(problem, solution)
```

### Solve a problem

Solve a given Math 24 problem. The problem should be passed as an array of four
integers. This method will return an expression string containing the same four
integers from the given problem that, when evaluated, will equal 24.

```
Math24.solve(problem)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/randallreedjr/math24.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
