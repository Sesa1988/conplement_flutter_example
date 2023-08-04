# Release infos


## Android

- `flutter build appbundle --release --flavor live --obfuscate --split-debug-info=build/app/outputs/symbols --dart-define=env_name=live --dart-define=use_fake_ads=true`

## macOS

- `flutter build macos --release -t lib/main_desktop.dart --dart-define=env_name=live --dart-define=use_fake_ads=true`

## Windows

- `flutter build windows --release -t lib/main_desktop.dart --dart-define=env_name=live --dart-define=use_fake_ads=true`

- `flutter pub run msix:create --store`

## Web

- `flutter build web --web-renderer canvaskit --release -t lib/main_web.dart --dart-define=env_name=live --dart-define=use_fake_ads=true `
