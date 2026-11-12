# frozen_string_literal: true

module RecordingStudioHistory
  class Configuration
    attr_reader :hooks

    def initialize
      @hooks = RecordingStudio::Hooks.new
    end
  end
end
