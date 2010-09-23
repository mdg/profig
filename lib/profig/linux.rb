
require 'fileutils'

module Profig


def self.handle_linux_dir(name, opts)
	FileUtils.mkdir_p(name)
	if opts.has_key? 'owner'
		owner, group = split_owner(opts['owner'])
		FileUtils.chown(owner, group, name)
	end
	if opts.has_key? 'mode'
		mode = opts['mode']
		FileUtils.chmod(mode, name)
	end
end


def self.split_owner(owner_str)
	split_owner = owner_str.split(':')
	owner, group = nil, nil
	if split_owner.length == 1
		owner = split_owner[0]
	elsif split_owner[0].length == 0
		group = split_owner[1]
	else
		owner = split_owner[0]
		group = split_owner[1]
	end
	return owner, group
end


end # module
