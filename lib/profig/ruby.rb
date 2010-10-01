
module Profig


def self.handle_gem(gem_name, opts)
	cmd = "gem install #{gem_name}"
	system cmd
end


end # module
