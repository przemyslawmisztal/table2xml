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

# and now we are after fields and data types
# removing not needed part of the script
contents = contents.split(/.*CREATE TABLE \[dbo\].\[/)[1]

# and extracting what we need
fields_table = contents.scan(/(?<=\[).*?(?=\])/)

# create dictionary of those extracted fields
$i = 0
output_lines_array = Array.new
# going to loop over extracted fields, they always come in pairs that's why +2 iterator incrementation
while $i == 0 || fields_table[$i + 1] != nil do
  output_lines_array.push("#{table_name}.#{fields_table[$i]} as '#{fields_table[$i]}'") if fields_table[$i + 1] != nil
 
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
BEGIN
  SET NOCOUNT ON;
  
  SELECT (
    SELECT
      #{output_lines_array.join(",\n      ")}
    FROM [dbo].[#{table_name}]
    FOR XML AUTO, ELEMENTS, TYPE
  ) .query ('for $i in /#{table_name} return <DataArea>{$i}</DataArea>')
end"

puts output_header