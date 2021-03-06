# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parcel/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'parcel-rails'
  spec.version       = Parcel::Rails::VERSION
  spec.authors       = ['Jakob Laegdsmand']
  spec.email         = ['jakoblaegdsmand@gmail.com']

  spec.summary       = 'Rails integration of parceljs bundler'
  spec.description   = 'Rails integration of parceljs bundler'
  spec.license       = 'UNLICENSED'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rubocop'
end
