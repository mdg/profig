
module Profig


def self.handle_cabal(package_name, opts)
	cmd = "cabal install #{package_name}"
	system cmd
end


end # module
