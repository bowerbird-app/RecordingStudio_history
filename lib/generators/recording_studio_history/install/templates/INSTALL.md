RecordingStudioHistory install complete.

Next steps:

1. Review `config/initializers/recording_studio_history.rb`. `RecordingStudioHistory.configuration.hooks` is a `RecordingStudio::Hooks` instance. There are no other settings.
2. The generator mounted `RecordingStudioHistory::Engine` at the `mount_path` you passed. Where the engine is mounted is still a product decision.
3. Run `bin/rails tailwindcss:build` if you use Tailwind CSS.
4. Keep strict recordable declarations enabled and add `recording_studio_recordable(...)` to every configured recordable before running `RecordingStudio.validate_recordable_declarations!`.
