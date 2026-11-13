# Dummy App

This Rails app boots recording_studio_history in a host application.

## What It Covers

- Devise authentication with a seeded admin user
- `Current.actor` wiring for Recording Studio events
- Root workspace plus seeded folder and page recordables
- Recording Studio default layout, FlatPack assets, and Tailwind source scanning
- Mounted `RecordingStudio::Engine` route behavior inside a host app
- Dummy-only `/docs/*` pages for gem-specific onboarding

## Quick Start

```bash
cd test/dummy
bundle install
bin/rails db:setup
bin/dev
```

Run the commands above from the dummy app directory, not the repository root.

Then open the app and sign in with:

- Email: `admin@admin.com`
- Password: `Password`

## Useful Routes

- `/` - dummy app home page
- `/recording_studio` - redirects to `/` while the mounted Recording Studio engine stays available under that prefix for non-root routes
- `/users/sign_in` - Devise sign-in page
- `/docs/install`, `/docs/config`, `/docs/recordable_types`, `/docs/recordings_tree`, `/docs/gem_views`, `/docs/methods` - dummy-only starter pages
- `/up` - Rails health check

## Why This App Exists

Use this app to verify authentication, recordable declarations, layout, and asset scanning. If a layout, route, asset source, or Recording Studio initializer change breaks here, fix it in this addon before a host app takes the change.

Authenticated pages use Recording Studio's shared default layout. Devise sign-in keeps `layouts/application`. Replace dummy docs page content so it matches the gem's actual concepts.

The home page in `app/views/home/index.html.erb` should stay a short demo that the addon boots. Do not turn it into a wall of documentation. The dummy docs pages hold the longer notes.
