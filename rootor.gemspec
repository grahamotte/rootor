Gem::Specification.new do |spec|
  spec.name                  = 'rootor'
  spec.version               =  '0.0.3'
  spec.date                  = '2017-01-09'
  spec.authors               = 'lightbright'
  spec.email                 = 'graham.otte@gmail.com'
  spec.homepage              = 'http://what.com'
  spec.summary               = 'XMLRPC interface'
  spec.required_ruby_version = '>= 2.3.0'
  spec.license               = 'MIT'
  spec.description           = ''
  spec.files                 = Dir.glob("{lib,spec}/**/*.rb") + ["README.md"]
  
  spec.add_runtime_dependency 'filesize'
end
