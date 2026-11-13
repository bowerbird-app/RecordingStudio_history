# recording_studio_history

`recording_studio_history` is a Recording Studio addon for history. This version ships the engine. History features come later.

Installing the gem does not enable capability mixins on host types. The addon uses `RecordingStudio::Hooks` and `RecordingStudio::Services::BaseService` from core. It does not copy those classes.

## Install

Add the gem to the host application Gemfile.

```ruby
gem "recording_studio_history", github: "bowerbird-app/RecordingStudio_history"
```

The gemspec requires Ruby 3.3 or newer, Rails `~> 8.1.0`, and `recording_studio` `~> 4.2`.

## Configuration

`RecordingStudioHistory.configure` yields `RecordingStudioHistory::Configuration`. The only setting is `hooks`, a `RecordingStudio::Hooks` instance. There is no API key, feature flag, timeout, or `config/recording_studio_history.yml`.

## Mount point

`recording_studio_history:install` can mount `RecordingStudioHistory::Engine`. Where the engine is mounted is still a product decision. This version does not treat a path as the addon contract.

## Run the dummy app

The dummy app is a host application. It boots this addon with Workspace, Folder, and Page recordables. `config.require_recordable_declarations` stays true.

```bash
cd test/dummy
bin/rails db:setup
bin/dev
```

Open port 3000 and sign in at `/users/sign_in`.

| Field | Value |
| --- | --- |
| Email | admin@admin.com |
| Password | Password |

The home page is `/`. `/recording_studio` redirects to `/`.

Dummy credentials use the shared Recording Studio development master key. Set `RAILS_MASTER_KEY`, or put that key in `test/dummy/config/master.key`. That file is gitignored. Do not generate a new master key, and do not commit the key.

## Run the tests

From the repository root:

```bash
bundle install
BUNDLE_GEMFILE=test/dummy/Gemfile bundle install
bundle exec rake test:all
bundle exec rubocop
```

`rake test:all` runs the gem tests and the dummy app tests.

## Dummy addon tags

The dummy app pins these GitHub tags. `MIGRATION_NOTES.md` is the same list, with the Rails and Ruby requirements.

- Recording Studio dummy GitHub tag `v4.7.1`
- FlatPack dummy GitHub tag `v0.1.331`
- Accessible dummy GitHub tag `v0.18.0`
- Trashable dummy GitHub tag `v0.11.0`
- Root Switchable dummy GitHub tag `v0.10.0`
- Metrics dummy GitHub tag `v0.3.1`
