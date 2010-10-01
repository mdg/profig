
module Profig


def self.handle_egg(egg_name, opts)
	cmd = "pip install #{egg_name}"
	system cmd
end


end # module
