Gem::Specification.new do |s|
  s.name        = 'math24gamecli'
  s.version     = '0.0.1'
  s.date        = '2014-06-14'
  s.summary     = "Command Line Interface for interactive Math 24 game"
  s.description = "Allows a user to play the 24 Game and provide solutions to randomly generated puzzles"
  s.has_rdoc    = false
  s.authors     = ["Randall Reed, Jr."]
  s.email       = 'randallreedjr@gmail.com'
  s.files       = ["lib/math24gamecli.rb"]
  s.homepage    = 'http://rubygems.org/gems/math24gamecli'
  s.license     = 'MIT'
  s.add_dependency 'math24', '0.0.2'
  s.add_dependency 'math24game', '0.0.1'
  s.executables << 'math24game'
end