# frozen_string_literal: true

require "test_helper"

class ConfigurationTest < Minitest::Test
  def setup
    @original_configuration = RecordingStudioHistory.instance_variable_get(:@configuration)
    RecordingStudioHistory.instance_variable_set(:@configuration, nil)
  end

  def teardown
    RecordingStudioHistory.configuration.hooks.clear! if RecordingStudioHistory.instance_variable_get(:@configuration)
    RecordingStudioHistory.instance_variable_set(:@configuration, @original_configuration)
  end

  def test_configuration_exposes_core_hooks_and_no_placeholder_settings
    configuration = RecordingStudioHistory::Configuration.new

    assert_instance_of RecordingStudio::Hooks, configuration.hooks
    refute_respond_to configuration, :api_key
    refute_respond_to configuration, :enable_feature_x
    refute_respond_to configuration, :timeout
    refute_respond_to configuration, :merge!
  end

  def test_configure_yields_the_configuration_and_can_register_a_hook
    yielded = nil
    called = false

    RecordingStudioHistory.configure do |config|
      yielded = config
      config.hooks.before_initialize { called = true }
    end

    yielded.hooks.run(:before_initialize, nil)

    assert_same RecordingStudioHistory.configuration, yielded
    assert called
  end

  def test_configure_without_block_is_safe
    RecordingStudioHistory.configure

    assert_kind_of RecordingStudioHistory::Configuration, RecordingStudioHistory.configuration
    assert_instance_of RecordingStudio::Hooks, RecordingStudioHistory.configuration.hooks
  end
end
