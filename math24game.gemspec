Gem::Specification.new do |s|
  s.name        = 'math24game'
  s.version     = '0.0.1'
  s.date        = '2014-06-14'
  s.summary     = "Math 24 game base gem"
  s.description = "generate_problem will randomly generate a solvable 24 Game puzzle; solve? will check a solution, passed as a string"
  s.has_rdoc    = false
  s.authors     = ["Randall Reed, Jr."]
  s.email       = 'randallreedjr@gmail.com'
  s.files       = ["lib/math24game.rb"]
  s.homepage    = 'http://rubygems.org/gems/math24game'
  s.license     = 'MIT'
  s.add_dependency  'math24', '0.0.2'
end