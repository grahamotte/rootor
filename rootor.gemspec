Gem::Specification.new do |spec|
  spec.name                  = 'rootor'
  spec.version               = '0.0.5'
  spec.date                  = '2017-01-09'
  spec.authors               = 'graham otte'
  spec.email                 = 'graham.otte@gmail.com'
  spec.summary               = 'XMLRPC ruby interface'
  spec.required_ruby_version = '>= 2.3.0'
  spec.license               = 'MIT'
  spec.files                 = Dir.glob('{lib,spec}/**/*.rb') + ['README.md']

  spec.add_runtime_dependency 'filesize'
end
