# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'tinder_auth_fetcher'
  spec.version       = '0.1.1'
  spec.authors       = ['Shuhei Kitagawa']
  spec.email         = ['shuhei.kitagawa@gmail.com']

  spec.summary       = %q{TinderAuthFetcher enables you to retrieve a Facebook authentication token, which is necessary to use Tinder API}
  spec.homepage      = 'https://github.com/shuheiktgw/tinder_auth_fetcher'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency "selenium-webdriver", "~> 3.142"
  spec.add_dependency "webdrivers", "~> 3.8"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end
