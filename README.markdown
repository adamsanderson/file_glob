FileGlob
========

Quacks like a Regexp, tastes like Dir.glob.

Use FileGlob in place of a Regexp when [shell pattern matching ](http://www.ruby-doc.org/core-1.9.3/File.html#method-c-fnmatch) makes more sense.

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
