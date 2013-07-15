require "minitest/autorun"
require_relative "../lib/file_glob"

# These tests minimal verify the interface of FileGlob.
# They ensure that it behaves like a regexp for matching purposes.
# 
# For tests around behavior, see file_glob_test.rb
#
class InterfaceTest < MiniTest::Unit::TestCase
  MATCH = "file.rb"
  
  def setup
    @glob = FileGlob.new '*.rb'
  end
  
  def test_responds_to_matching_methods
    assert @glob.respond_to? :"=~"
    assert @glob.respond_to? :match
    assert @glob.respond_to? :"==="
  end
  
  def test_squiggle_operator_returns_an_index
    i = @glob =~ MATCH
    
    assert_kind_of Fixnum, i
  end
  
  def test_match_returns_a_match_data_like_object
    data = @glob.match(MATCH)
    
    assert data.respond_to? :[]
    assert data.respond_to? :string
    assert data.respond_to? :length
  end
  
end