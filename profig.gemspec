
Gem::Specification.new do |s|
	s.name     = 'profig'
	s.version  = '0.01'
	s.platform = Gem::Platform::RUBY
	s.authors  = ['Matthew Graham']
	s.email    = ['mdg149@gmail.com']
	s.homepage = 'http://github.com/mdg/profig'
	s.summary  = 'Limited system configuration manager'
	s.description = 'Push-modeled system configuration manager with limited feature set'

	s.files = Dir.glob("{bin,lib}/**/*")
	s.executables = ['profig']
	s.require_paths = ["lib"]
end
