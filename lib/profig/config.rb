require 'yaml'

module Profig


# Take an array of configs, and merge them into a single list
def self.merge_config(confs)
	merge = {}
	confs.each do |c|
		c.each do |name, items|
			if merge.has_key? name:
				merge[name].concat(items)
			else
				merge[name] = items
			end
		end
	end
	return merge
end


def self.load_config_yaml(directory)
	files = Dir.glob("#{directory}/*")
	confs = []
	files.each do |f|
		if File.file?(f)
			confs << YAML.load_file(f)
		end
	end
	return confs
end


def self.load_config(directory)
	confs = load_config_yaml(directory)
	return merge_config(confs)
end


end
