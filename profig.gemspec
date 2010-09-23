

Gem::Specification.new do |s|
	# this will only work properly when building a gem from a git repo
	# not sure how to make it work for downloaded source, not really
	# that bothered about it right now
	version = `git describe`.sub(/v/, '').gsub(/\-/, '.')

	s.name     = 'profig'
	s.version = version
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

