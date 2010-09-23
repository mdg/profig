
require 'fileutils'

module Profig


def self.handle_linux_file(name, opts)
	src = opts['source']
	owner, group = split_owner(opts['owner'])
	mode = opts['mode']

	FileUtils.copy(src, name)
	FileUtils.chown(owner, group, name)
	FileUtils.chmod(mode, name) if mode
end


def self.handle_linux_dir(name, opts)
	owner, group = split_owner(opts['owner'])
	mode = opts['mode']

	FileUtils.mkdir_p(name)
	FileUtils.chown(owner, group, name)
	FileUtils.chmod(mode, name) if mode
end


def self.split_owner(owner_str)
	if owner_str.nil?
		return nil, nil
	end

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
