
module Profig
# Handlers for various installers / package managers

# Package Installers
#
def self.handle_cabal(pkg_name, opts)
	cmd = "cabal install #{package_name}"
	system cmd
end

def self.handle_deb(pkg_name, opts)
	cmd = "apt-get install -y #{pkg_name}"
	system cmd
end

def self.handle_egg(egg_name, opts)
	cmd = "pip install #{egg_name}"
	system cmd
end

def self.handle_gem(gem_name, opts)
	cmd = "gem install #{gem_name}"
	system cmd
end

def self.handle_yum(pkg_name, opts)
	cmd = "yum install -y #{pkg_name}"
	system cmd
end


# Source Installers
#
def self.handle_rake(path, opts)
	pwd = Dir.pwd
	Dir.chdir path
	target = opts['target']
	cmd = "rake #{target}"
	system cmd
	Dir.chdir pwd
end

end # module
