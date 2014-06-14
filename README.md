sMath24
======

Solver for the Math 24 game

This repository holds the source code for the math24, math24cli, math24game, and math24gamecli ruby gems.

math24 is the base gem, which implements the solver. math24cli is a command line interface to allow a user to interact with the math24 solver via the command line.

math24game is another base gem, which implements generate_problem and solution? for checking a user provided solution. math24gamecli is a command line interface for the game, and allows the user to solve randomly generated 24 Game puzzles.

Installing the math24cli gem should automatically install the math24 gem. Installing the math24gamecli gem should install all dependencies.

For more information see:
[math24 at rubygems.org](https://rubygems.org/gems/math24)
[math24cli at rubygems.org](https://rubygems.org/gems/math24cli)
[math24game at rubygems.org](https://rubygems.org/gems/math24game)
[math24gamecli at rubygems.org](https://rubygems.org/gem/math24gamecli)

*NOTE* If you just want the command line game, run:
    gem install math24gamecli
To start the game, type
    math24game
in your terminal.
To quit, just type
    exit