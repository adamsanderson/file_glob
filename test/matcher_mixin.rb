# These tests minimaly verify the interface of a "matcher" object.
# They ensure that it behaves like a regexp for matching purposes.
# 
# For tests around behavior, see file_glob_test.rb
#
module MatcherMixin
  
  def setup
    raise NotImplementedError.new "Setup must define @matcher"
  end
  
  def matching_example
    raise NotImplementedError.new "Provide a string that matches @matcher"
  end
  
  def test_responds_to_matching_methods
    assert @matcher.respond_to? :"=~"
    assert @matcher.respond_to? :match
    assert @matcher.respond_to? :"==="
  end
  
  def test_squiggle_operator_returns_an_index
    i = @matcher =~ matching_example
    
    assert_kind_of Fixnum, i
  end
  
  def test_match_returns_a_match_data_like_object
    data = @matcher.match(matching_example)
    
    assert data.respond_to? :[]
    assert data.respond_to? :string
    assert data.respond_to? :length
  end
  
end