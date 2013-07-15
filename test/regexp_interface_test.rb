require "minitest/autorun"
require_relative "./matcher_mixin"

# Verify that Regexp quacks like a "matcher".
# 
# This might seem silly, but it ensures that the duck type we are attempting to
# match actually matches our expectations.
# 
class RegexpInterfaceTest < MiniTest::Unit::TestCase
  include MatcherMixin
  
  def setup
    @matcher = /.+\.rb/
  end
  
  def matching_example
    "file.rb"
  end
end