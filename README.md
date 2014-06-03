table2xml
=========

Simple tool that makes selecting data from MSSQL table into XML a little bit easier.

## Quick start

- Install ruby
  - [Download ruby] (https://www.ruby-lang.org/en/downloads/)
  - or use [Ruby installer for Windows] (http://rubyinstaller.org/)
- [Download the latest release] (https://github.com/rocktail/table2xml/blob/master/src/table2xml.rb)

## Usage

- Generate CREATE TABLE script using MS SQL Management Tools
- Save script to file
- Execute program `ruby table2xml.rb file_name`
- Two files will be created
  - ION_TABLE_2_XML containing selection of data into XML
  - ION_XML_2_TABLE that selects data out of XML into temporary table

## Compatibility

So far tool was tested with:

- Microsoft SQL Server 10.50.1600.1
