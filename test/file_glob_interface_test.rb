require "minitest/autorun"
require_relative "./matcher_mixin"
require_relative "../lib/file_glob"

# Ensure our interface matches the "matcher" duck type of Regexp.
# 
class FileGlobInterfaceTest < MiniTest::Unit::TestCase
  include MatcherMixin
  
  def setup
    @matcher = FileGlob.new("*.rb")
  end
  
  def matching_example
    "file.rb"
  end
  
end