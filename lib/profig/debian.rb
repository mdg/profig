
module Profig

def self.handle_debian_deb(pkg_name, opts)
	cmd = "apt-get install -y #{pkg_name}"
	system cmd
end

end # module
