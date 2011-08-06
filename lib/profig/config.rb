require 'yaml'

module Profig


# An individual piece of configuration
class Item
	attr_reader :name
	attr_reader :opts

	def initialize(name, opts)
		@name = name
		opts = {} if opts.nil?
		@opts = opts
	end
end

# A group of configuration items that are of the same type and should
# be handled at the same time
class Section
	attr_reader :type
	attr_reader :items

	def initialize(type)
		@type = type
		@items = []
	end

	def <<(item)
		if not item.instance_of? Item
			raise 'Unknown item type'
		end
		@items << item
	end

	def to_s()
		return "#<Profig::Section:#{@type}>"
	end
end


def self.load_config_directory(directory)
	# do a stable ordering by alphabetical
	files = Dir.glob("#{directory}/*").sort
	confs = []
	files.each do |f|
		if File.file?(f)
			confs << YAML.load_file(f)
		end
	end
	return confs
end


def self.yaml_items(yitems)
	yitems.each do |item|
		if item.instance_of? String
			name = item
			opts = nil
		else
			name = item.keys[0]
			opts = item[name]
		end
		yield name, opts
	end
end

def self.yaml_sections(yaml)
	yaml.each do |doc|
		if not doc.has_key? 'profig'
			raise 'Invalid configuration format'
		end

		doc['profig'].each do |yaml_section|
			type = yaml_section.keys[0]
			items = yaml_section[type]
			yield type, items
		end
	end
end

def self.yaml_to_sections(yaml)
	section_acc = []
	yaml_sections(yaml) do |type, yitems|
		section = Section.new(type)
		yaml_items(yitems) do |name, opts|
			section << Item.new(name, opts).freeze
		end
		section.freeze
		section_acc << section
	end
	return section_acc
end

def self.load_config(path)
	if File.file? path then
		confs = [YAML.load_file(path)]
	elsif File.directory? path then
		confs = load_config_directory(path)
	end
	return yaml_to_sections(confs)
end


end
