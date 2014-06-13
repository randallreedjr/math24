Gem::Specification.new do |s|
  s.name        = 'math24cli'
  s.version     = '0.0.1'
  s.date        = '2014-06-13'
  s.summary     = "Command Line Interface for Math 24 game solver"
  s.description = "Allows a user to interact with the Math24 gem through a command line interface"
  s.authors     = ["Randall Reed, Jr."]
  s.email       = 'randallreedjr@gmail.com'
  s.files       = ["lib/math24cli.rb"]
  s.homepage    = 'http://rubygems.org/gems/math24cli'
  s.license     = 'MIT'
  s.add_dependency  'math24', Math24::VERSION
  s.executabes << 'math24'
end