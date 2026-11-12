# frozen_string_literal: true

module RecordingStudioHistory
  class Engine < ::Rails::Engine
    isolate_namespace RecordingStudioHistory

    class << self
      def apply_model_extensions(target)
        apply_extensions(target, extensions_for(:model, extension_keys_for(target)))
      end

      def apply_controller_extensions(target)
        apply_extensions(target, extensions_for(:controller, extension_keys_for(target)))
      end

      private

      def extensions_for(kind, names)
        hooks = RecordingStudioHistory.configuration.hooks
        Array(names).flat_map do |name|
          if kind == :model
            hooks.model_extensions_for(name)
          else
            hooks.controller_extensions_for(name)
          end
        end
      end

      def apply_extensions(target, extensions)
        return unless target

        applied = target.instance_variable_get(:@recording_studio_history_applied_extensions) || identity_hash

        extensions.flatten.compact.each do |extension|
          next if applied[extension]

          target.class_eval(&extension)
          applied[extension] = true
        end

        target.instance_variable_set(:@recording_studio_history_applied_extensions, applied)
      end

      def extension_keys_for(target)
        names = [target.name, target.name&.demodulize].compact.uniq
        names.map(&:to_sym)
      end

      def identity_hash
        {}.compare_by_identity
      end
    end

    initializer "recording_studio_history.before_initialize",
                before: "recording_studio_history.on_configuration" do |_app|
      RecordingStudioHistory.configuration.hooks.run(:before_initialize, self)
    end

    initializer "recording_studio_history.on_configuration" do |_app|
      RecordingStudioHistory.configuration.hooks.run(:on_configuration, RecordingStudioHistory.configuration)
    end

    initializer "recording_studio_history.after_initialize",
                after: "recording_studio_history.on_configuration" do |_app|
      RecordingStudioHistory.configuration.hooks.run(:after_initialize, self)
    end

    # Apply model extensions when models are loaded
    initializer "recording_studio_history.apply_model_extensions" do
      config.to_prepare do
        next unless defined?(ActiveRecord::Base)

        ActiveRecord::Base.descendants.each do |model|
          next if model.abstract_class?

          RecordingStudioHistory::Engine.apply_model_extensions(model)
        end
      end
    end

    # Apply controller extensions
    initializer "recording_studio_history.apply_controller_extensions" do
      config.to_prepare do
        next unless defined?(ActionController::Base)

        ActionController::Base.descendants.each do |controller|
          RecordingStudioHistory::Engine.apply_controller_extensions(controller)
        end
      end
    end
  end
end
