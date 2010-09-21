#! /usr/bin/env ruby

require 'optparse'

require 'profig/config'
require 'profig/main'


def parse_args()
	options = {}
	OptionParser.new do |opts|
		opts.banner = 'Usage: profig'

		opts.on('-d', '--directory DIR', 'Select directory') do |d|
			options[:directory] = d
		end
	end.parse!

	return options, ARGV
end

def main()
	opts, args = parse_args()
	p opts
	p args

	os = :ubuntu

	config = Profig.load_config(opts[:directory])
	Profig.run(os, config)
end


main()
