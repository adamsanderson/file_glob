require "minitest/autorun"
require_relative "../lib/file_glob"

class FileGlobTest < MiniTest::Unit::TestCase
  MATCH    = "file.rb"
  NO_MATCH = "file.yml"
  
  def setup
    @glob = FileGlob.new '*.rb'
  end
  
  def test_matches_with_squiggle_operator
    assert @glob =~ MATCH
  end
  
  def test_only_matches_when_pattern_matches
    assert !(@glob =~ NO_MATCH)
  end
  
  def test_can_be_used_on_righthand_side
    assert MATCH =~ @glob
  end
  
  def test_matches_with_match
    assert @glob.match(MATCH)
  end
  
  def test_only_matches_with_match_when_pattern_matches
    assert !@glob.match(NO_MATCH)
  end
  
  def test_can_be_used_in_a_case_statement
    case MATCH
    when @glob then assert(true)
    else flunk "Should define ==="
    end
  end
end