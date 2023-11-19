# flutter_application_template

## Architecture

**lib** - ui layer.

**core** - the basic entities that are used in all modules.

**data** - data storage, working with the api, working with the database, working with remote and local repositories, implementing repositories.

**domain** - repository interfaces, `entity`, `use_case`

**di** - registering dependencies

**network** - working with the network

## Working with the project

To control the flutter version, the application uses [fvm](https://fvm.app/) (the current version is specified in the `.fvmrc` file)

To control the modules [melos](https://pub.dev/packages/melos)

A set of commands in the file `melos.yaml`:

- `melos bs` - pub get for the whole project
- `melos gen` - starting code generation for all modules
- `melos locale` - localization generation
- `melos assets` - asset generation
- `melos format` и `melos analyze` - formatting and analyzing the entire project
- `melos icons` - generating application icons
- `melos splash` - generating splash screen
- `melos release_apk` - building a release application for android
- `melos check` - Commit preparation/validation for CI, that there are no major problems

The settings for icon generation are stored in `flutter_launcher_icons.yaml`

Settings for generating splash screen in `flutter_native_splash.yaml`

## Before the start of the project

You need to add to the android/local.properties file:

```sh
flutter.minSdkVersion=21
flutter.targetSdkVersion=34
flutter.compileSdkVersion=34
```

1. fvm use `flutter version`
2. melos bs
3. melos gen
