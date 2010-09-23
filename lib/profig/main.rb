require 'profig/ubuntu'


module Profig


# Run all items one at a time
def self.run_item_handler(handler, items)
	items.each do |i|
		handler.call(i.name, i.opts)
	end
end


def self.run(os, sections)
	users_groups = `id -G`.split()
	if not users_groups.include? "0"
		# this should be made an exception at some point
		puts "You must be root to run profig."
		exit
	end

	sections.each do |section|
		type = section.type
		section_handler_name = "handle_#{type}_section_for_#{os}"
		#item_handler_name = "handle_#{type}_item_for_#{os}"
		item_handler_name = "handle_#{os}_#{type}"

		# first check if there's a section handler for this type
		# a section handler takes all items at once
		if Profig.respond_to? section_handler_name
			handler = method(section_handler_name)
			handler.call(section.items)
		# second, check if tere's a handler for individual items
		# this type of handler will process items one at a time
		elsif Profig.respond_to? item_handler_name
			handler = method(item_handler_name)
			run_item_handler(handler, section.items)
		# if no handlers, complain about it and move on
		else
			puts "No #{type} handlers for #{os}"
			next
		end
	end
end


end # module
