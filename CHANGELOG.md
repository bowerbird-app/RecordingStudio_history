# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2026-11-12

### Changed

- Start `recording_studio_history` from the Recording Studio addon engine skeleton.
- Set `RecordingStudioHistory::VERSION` to `0.1.0`.
- Point gemspec metadata at https://github.com/bowerbird-app/RecordingStudio_history.
- Remove the example capability mixin. Installing the gem does not enable capability mixins on host types.
- Drop the placeholder settings `api_key`, `enable_feature_x`, and `timeout`, including `RECORDING_STUDIO_HISTORY_API_KEY` and YAML or `config.x` loading. `RecordingStudioHistory.configuration` exposes `hooks` only.
- Remove the sample `recording_studio_history_pages` table and the `recording_studio_history:migrations` generator. The engine ships no migrations.
- Keep `recording_studio_history:install`. Where the engine is mounted is still a product decision.

[Unreleased]: https://github.com/bowerbird-app/RecordingStudio_history/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/bowerbird-app/RecordingStudio_history/releases/tag/v0.1.0
