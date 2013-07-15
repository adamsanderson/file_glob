FileGlob
========

Quacks like a Regexp, tastes like Dir.glob.

Use this with any library that expects a regular expression.  For instance, the `listen` gem normally checks file paths against a regular expression.  You can use a FileGlob instead to define a more natural matcher.

Usage 
-----

Filter a set of file paths:

    glob = FileGlob.new("test/**/*_test.rb")
    paths.select{|path| path =~ glob }
    
Perform different actions for different file types:
    
    image = FileGlob.new("*.{png,jpg,gif}")
    text  = FileGlob.new("*.txt")
    
    case path
    when image then process_image(path)
    when text  then process_text(path)
    end
    
Installation
------------

Install with rubygems:

    gem install file_glob

-----

Adam Sanderson, http://www.monkeyandcrow.com
