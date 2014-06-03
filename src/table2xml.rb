#!/usr/bin/env ruby

# first we have to read name of the file passed as first argument
create_script_file = ''

ARGV.each do |a|
  create_script_file = a
end

# let's see if that file exists and abort if doesn't
unless File.file?(create_script_file)
  abort("ABORT: File #{create_script_file} doesn't exists in current directory")
end

# now we have to read contents of the file
file = File.open(create_script_file)
contents = file.read

# don't forget to close
file.close

# check if it is indeed create table script and abort if not
unless contents.include? "CREATE TABLE"
  abort("ABORT: Provided content doesn't look like a CREATE TABLE script")
end

# grab table name
table_name = puts contents[/.*CREATE TABLE \[dbo\].\[([^\]]*)/, 1]