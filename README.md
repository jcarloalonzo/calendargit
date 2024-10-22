['url'](https://api.empeli.com/Store/swagger/index.html)

flutter pub run build_runner build --delete-conflicting-outputs

flutter build apk --flavor staging -t lib/main_staging.dart --release
flutter build apk --flavor production -t lib/main_production.dart --release

flutter build appbundle --flavor production -t lib/main_production.dart --release
