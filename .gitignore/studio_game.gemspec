Gem::Specification.new do |s|
  s.name         = "studio_game"
  s.version      = "0.5.0"
  s.author       = "Brad Hollerbach"
  s.email        = "emailgoesherecom"
  s.homepage     = "http://semissourian.com"
  s.summary      = "Brads test game from Pragmatic Studio class"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/*"]
  s.executables   = [ 'studio_game' ]
  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
  
