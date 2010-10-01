require 'profig/linux'
require 'profig/debian'
require 'profig/python'
require 'profig/ruby'

module Profig


def self.handle_ubuntu_group(group_name, opts)
	if not group_name.instance_of? String
		raise 'Unknown group definition'
	end

	cmd = "addgroup -q --system #{group_name}"
	system(cmd)
end

def self.handle_ubuntu_user(user_name, opts)
	if not user_name.instance_of? String
		raise 'Unknown user type'
	elsif not /[a-zA-Z][a-zA-Z0-9_]+/.match user_name
		raise 'Invalid user format'
	end

	cmd = "adduser -q --system --no-create-home"
	cmd += " --disabled-password --disabled-login #{user_name}"
	system cmd
end

def self.handle_ubuntu_deb(pkg_name, opts)
	Profig.handle_debian_deb(pkg_name, opts)
end

def self.handle_ubuntu_egg(egg_name, opts)
	Profig.handle_egg(egg_name, opts)
end

def self.handle_ubuntu_gem(gem_name, opts)
	Profig.handle_gem(gem_name, opts)
end

def self.handle_ubuntu_dir(name, opts)
	Profig.handle_linux_dir(name, opts)
end

def self.handle_ubuntu_file(name, opts)
	Profig.handle_linux_file(name, opts)
end


end # module
