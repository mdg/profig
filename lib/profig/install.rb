
module Profig
# Handlers for various installers / package managers

# Package Installers
#
def self.handle_cabal(pkg_name, opts)
	cmd = "cabal install #{package_name}"
	system cmd
end

def self.handle_deb_set(pkgs)
	cmd = "apt-get install -y"
	pkgs.each do |pkg|
		cmd += ' '+ pkg.name
	end
	system cmd
end

def self.handle_egg_set(eggs)
	cmd = "pip install"
	eggs.each do |egg|
		cmd += ' '+ egg.name
	end
	system cmd
end

def self.handle_gem_set(gems)
	cmd = "gem install"
	gems.each do |gem|
		cmd += ' '+ gem.name
	end
	system cmd
end

def self.handle_rpm_set(rpms)
	cmd = "yum install -y"
	rpms.each do |rpm|
		cmd += ' '+ rpm.name
	end
	system cmd
end

def self.handle_yum_set(rpms)
	self.handle_rpm_set(rpms)
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
