require_relative "lib/feedbackbin_elements/version"

Gem::Specification.new do |spec|
  spec.name        = "feedbackbin_elements"
  spec.version     = FeedbackbinElements::VERSION
  spec.authors     = [ "murny" ]
  spec.email       = [ "1930474+murny@users.noreply.github.com" ]
  spec.homepage    = "https://github.com/murny/feedbackbin_elements"
  spec.summary     = "Shadcn-inspired UI component library for Ruby on Rails, built with Tailwind CSS."
  spec.description = "Shadcn-inspired UI component library for Ruby on Rails, built with Tailwind CSS."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/murny/feedbackbin_elements"
  spec.metadata["changelog_uri"] = "https://github.com/murny/feedbackbin_elements/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  end

  spec.add_dependency "rails", ">= 8.1.1"
  spec.add_dependency "lucide-rails"
  spec.add_dependency "importmap-rails"
  spec.add_dependency "propshaft"
  spec.add_dependency "turbo-rails"
  spec.add_dependency "stimulus-rails"
  spec.add_dependency "tailwindcss-rails"
  spec.add_dependency "tailwind_merge"
end
