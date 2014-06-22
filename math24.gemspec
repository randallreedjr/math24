Gem::Specification.new do |s|
  s.name        = 'math24'
  s.version     = '1.0.3'
  s.date        = '2014-06-21'
  s.summary     = "Command-line Math 24 game"
  s.description = "Randomly generates a solvable 24 Game problem, verifies user's solution"
  s.has_rdoc    = false
  s.authors     = ["Randall Reed, Jr."]
  s.email       = 'randallreedjr@gmail.com'
  s.files       = ["lib/math24.rb", "lib/math24solver.rb", "lib/math24gamecli.rb"]
  s.homepage    = 'http://rubygems.org/gems/math24'
  s.license     = 'MIT'
  s.executables = ["math24"]
end