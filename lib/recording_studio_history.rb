# frozen_string_literal: true

require "recording_studio"
require "recording_studio_history/version"
require "recording_studio_history/engine"
require "recording_studio_history/configuration"

module RecordingStudioHistory
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration) if block_given?
    end
  end
end
