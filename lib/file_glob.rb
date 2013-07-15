class FileGlob
  attr_reader :pattern
  
  def initialize(pattern)
    @pattern = pattern
  end
  
  def =~ path
    0 if File.fnmatch?(pattern, path)
  end
  
  def === path
    File.fnmatch?(pattern, path)
  end
  
  def match(path)
    GlobMatchData.new(path) if self =~ path
  end
  
  def to_s
    pattern
  end
  
  def inspect
    "<#FileGlob #{pattern}>"
  end
  
  private
  
  # Interface that quacks like Regexp's MatchData.
  # It should cover most common cases.
  class GlobMatchData
    attr_reader :string
    
    def intialize(string)
      @string = string
    end
    
    def [] i
      check_index!(i)
      string
    end
    
    def begin(i)
      check_index!(i)
      0
    end
    
    def end
      check_index!(i)
      string.length
    end
    
    def size
      1
    end
    
    alias_method :length, :size
    
    def names
      []
    end
    
    private
    
    def check_index!(i)
      throw IndexError.new("FileGlob only matches once") if i > 0
    end
    
  end
end