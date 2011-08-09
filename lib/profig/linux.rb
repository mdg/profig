
require 'fileutils'

module Profig


def self.handle_user(user_name, opts)
	if not user_name.instance_of? String
		raise 'Unknown user type'
	elsif not /[a-zA-Z][a-zA-Z0-9_]+/.match user_name
		raise 'Invalid user format'
	end

	cmd = "useradd --no-user-group --system --no-create-home #{user_name}"
	system cmd
	if not [0,9].include?($?.exitstatus) then
		raise "Error creating user (#{$?.exitstatus}): #{user_name}"
	end
end

def self.handle_group(group_name, opts)
	if not group_name.instance_of? String
		raise 'Unknown group definition'
	end

	cmd = "groupadd --force --system #{group_name}"
	system cmd
end


def self.handle_file(name, opts)
	src = opts['source']
	owner, group = split_owner(opts['owner'])
	mode = opts['mode']

	raise 'nil filename' if not name
	raise "nil file source for #{name}" if not src

	FileUtils.copy(src, name)
	FileUtils.chown(owner, group, name)
	FileUtils.chmod(mode, name) if mode
end


def self.handle_dir(name, opts)
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


def self.handle_iptables_set(iptables)
	system 'iptables -F'
	iptables.each do |cfg|
		system "iptables #{cfg}"
	end
	system "/sbin/service iptables save"
end


end # module
