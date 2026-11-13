# frozen_string_literal: true

require_relative "lib/recording_studio_history/version"

Gem::Specification.new do |spec|
  spec.name        = "recording_studio_history"
  spec.version     = RecordingStudioHistory::VERSION
  spec.authors     = ["Bowerbird"]
  spec.homepage    = "https://github.com/bowerbird-app/RecordingStudio_history"
  spec.summary     = "Recording Studio addon for history"
  spec.description = "A Recording Studio addon for history. This version ships the engine. " \
                     "History features come later."
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 3.3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bowerbird-app/RecordingStudio_history"
  spec.metadata["changelog_uri"] = "https://github.com/bowerbird-app/RecordingStudio_history/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"].reject do |path|
      path == ".cursor" || path.start_with?(".cursor/")
    end
  end

  spec.add_dependency "rails", "~> 8.1.0"
  spec.add_dependency "recording_studio", "~> 4.2"
end
