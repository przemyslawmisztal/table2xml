#!/usr/bin/env ruby

# first we have to read file name passed as first argument
create_script_file = ''

ARGV.each do |a|
  create_script_file = a
end

puts "File name: #{create_script_file}"
# let's see if that file exists