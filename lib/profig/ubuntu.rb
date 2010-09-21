require 'profig/linux'

module Profig


def self.handle_ubuntu_system_group(group_name)
	if not group_name.instance_of? String
		raise 'Unknown group definition'
	end

	cmd = "addgroup -q --system #{group_name}"
	system(cmd)
end

def self.handle_ubuntu_system_user(user_name)
	if not user_name.instance_of? String
		raise 'Unknown user type'
	elsif not /[a-zA-Z][a-zA-Z0-9_]+/.match user_name
		raise 'Invalid user format'
	end

	cmd = "adduser -q --system --no-create-home"
	cmd += " --disabled-password --disabled-login #{user_name}"
	system cmd
end


end # module
