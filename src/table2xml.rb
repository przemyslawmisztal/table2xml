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
table_name = contents[/.*CREATE TABLE \[dbo\].\[([^\]]*)/, 1]

# and now we need fields and data types
# removing not needed part of the script
contents = contents.split(/.*CREATE TABLE \[dbo\].\[/)[1]

# and extracting what we need
fields_table = contents.scan(/(?<=\[).*?(?=\])/)

# create dictionary of those extracted fields
$i = 0
field_name = nil
field_data_type = nil

# going to loop over extracted fields, they always come in pairs that's why +2 iterator incrementation
while $i == 0 || field_data_type != nil do
  field_name = fields_table[$i]
  field_data_type = fields_table[$i + 1]
  
  # display only for testing purposes
  puts field_name + "," + field_data_type if field_data_type != nil
  
  # let's get another pair
  $i+=2
end

# template for stored procedure with output xml
output_header = 
"SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[#{table_name}_2_XML]
AS
BEGIN"

puts output_header