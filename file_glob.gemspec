Gem::Specification.new do |s|
  s.name        = "file_glob"
  s.version     = "0.0.1"
  s.authors     = ["Adam Sanderson"]
  s.email       = ["netghost@gmail.com"]
  s.homepage    = "https://github.com/adamsanderson/file_glob"
  
  s.summary     = "Quacks like a Regexp, tastes like your shell's a file glob."
  s.description = "Use FileGlob in place of a Regexp when shell pattern matching makes more sense."

  s.files        = Dir.glob("{lib,test}/**/*") + ["README.markdown", "Rakefile"]
  s.require_path = "lib"
  s.license = 'MIT'
end