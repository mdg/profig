require 'profig/ubuntu'


module Profig


def self.run_handler(handler, items)
	items.each do |i|
		handler.call(i)
	end
end


def self.run(os, config)
	users_groups = `id -G`.split()
	if not users_groups.include? "0"
		puts "You must be root to run profig."
		exit
	end

	config.each do |name, items|
		handler_name = "handle_#{os}_#{name}"

		if not Profig.respond_to? handler_name
			puts "No #{name} handler for #{os}"
			next
		end

		handler = method(handler_name)
		run_handler(handler, items)
	end
end


end # module
