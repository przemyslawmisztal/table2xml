#!/usr/bin/env ruby

# first we have to read file name passed as first argument
create_script_file = ''

ARGV.each do |a|
  create_script_file = a
end

# let's see if that file exists and abort if doesn't
unless File.file?(create_script_file)
  abort("File #{create_script_file} doesn't exists in current directory")
end

puts "yep it worked"