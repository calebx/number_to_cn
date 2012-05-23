# -*- encoding: utf-8 -*-
require File.expand_path('../lib/number_to_cn/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["caleb.xiang"]
  gem.email         = ["caleb.xiang@gmail.com"]
  gem.description   = %q{simply gem for put digits number into cn.}
  gem.summary       = %q{123.to_cn_words #}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "number_to_cn"
  gem.require_paths = ["lib"]
  gem.version       = NumberToCn::VERSION
end
