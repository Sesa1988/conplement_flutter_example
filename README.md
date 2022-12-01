# Release infos

## Mobile

### Android

- `flutter build appbundle --release --flavor live --obfuscate --split-debug-info=build/app/outputs/symbols --dart-define=env_name=live --dart-define=use_fake_ads=true`

## macOS

- `flutter build macos --release -t lib/main_desktop.dart --dart-define=env_name=live --dart-define=use_fake_ads=true`

## Windows

- `flutter build windows --release -t lib/main_desktop.dart --dart-define=env_name=live --dart-define=use_fake_ads=true`

- `flutter pub run msix:create --store`

## Web

- `flutter build web --web-renderer canvaskit --release -t lib/main_web.dart --dart-define=env_name=live --dart-define=use_fake_ads=true `

### Android SkSL caching and build

- `flutter run --profile --flavor live --cache-sksl --purge-persistent-cache --dart-define=env_name=live --dart-define=use_fake_ads=true`

- `flutter build appbundle --release --flavor live --obfuscate --split-debug-info=build/app/outputs/symbols --dart-define=env_name=live --dart-define=use_fake_ads=true --bundle-sksl-path flutter_android.sksl.json`