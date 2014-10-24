Gem::Specification.new do |s|
  s.name        = 'ngenerators'
  s.version     = '0.0.2'
  s.date        = '2014-10-24'
  s.summary     = "Rails Generators for AngularJS."
  s.description = "This gem provides generators which generate AngularJS views,"\
    " controllers and resources for AngularJS."
  s.authors     = ["Diego Aguir Selzlein"]
  s.email       = 'diegoselzlein@gmail.com'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.homepage    = 'https://github.com/nerde/ngenerators'
  s.license     = 'MIT'

  s.add_dependency('i18n', '~> 0')
end
