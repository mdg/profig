
Gem::Specification.new do |s|
	s.name     = 'profig'
	s.version  = '0.01'
	s.platform = Gem::Platform::RUBY
	s.authors  = ['Matthew Graham']
	s.email    = ['mdg149@gmail.com']
	s.homepage = 'http://github.com/mdg/profig'
	s.summary  = 'A YAML-based system configuration manager'
	s.description = 'A YAML-based system configuration manager with no central server'

	s.files = Dir.glob("{bin,lib}/**/*")
	s.executables = ['profig']
	s.require_paths = ["lib"]
end
