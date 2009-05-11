# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gets_satisfaction}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Fleckenstein, Pius Uzamere"]
  s.date = %q{2009-05-11}
  s.description = %q{Integrates your Ruby app with Get Satisfaction FastPass.}
  s.email = %q{scott@getsatisfaction}
  s.extra_rdoc_files = ["CHANGELOG", "lib/fastpass.rb", "lib/gets_satisfaction.rb", "README.rdoc"]
  s.files = ["CHANGELOG", "gets_satisfaction.gemspec", "init.rb", "lib/fastpass.rb", "lib/gets_satisfaction.rb", "Manifest", "Rakefile", "README.rdoc"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/pius/gets_satisfaction}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Gets_satisfaction", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gets_satisfaction}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Integrates your Ruby app with Get Satisfaction FastPass.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<active_support>, [">= 0"])
      s.add_development_dependency(%q<oauth>, [">= 0"])
      s.add_development_dependency(%q<erb>, [">= 0"])
    else
      s.add_dependency(%q<active_support>, [">= 0"])
      s.add_dependency(%q<oauth>, [">= 0"])
      s.add_dependency(%q<erb>, [">= 0"])
    end
  else
    s.add_dependency(%q<active_support>, [">= 0"])
    s.add_dependency(%q<oauth>, [">= 0"])
    s.add_dependency(%q<erb>, [">= 0"])
  end
end
