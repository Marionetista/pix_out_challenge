# pix_code_challenge

A new Flutter project. Replicated the desired UI and tests.

## Getting Started
This project is a starting point for a Flutter application.
[Get Started](https://flutter.dev/docs/get-started/install)

## Run app
flutter run

## Run Tests
flutter test

## Show Tests Coverage

Install lcov in your mac:

```brew install lcov```

After, run command for generate tests:

```flutter test --coverage```

Generate files for show coverage tests:

```genhtml -o coverage coverage/lcov.info```

Open the "inde.html" in your browser to check the app coverage.

## Dependencies

  # datetime_picker_formfield_new: ^2.0.0
    -Used to implement a dateTimeWidget.
    - Dart Package: <https://pub.dev/packages/datetime_picker_formfield_new>
    - GitHub: <https://github.com/rekariproject/datetime_picker_formfield>
    - License: [MIT](https://pub.dev/packages/datetime_picker_formfield_new/license)

  # intl: ^0.18.0
    -Provides internationalization and localization facilities.
    - Dart Package: <https://pub.dev/packages/intl>
    - GitHub: <https://github.com/dart-lang/intl>
    - License: [BSD-3](https://pub.dev/packages/intl/license)

  # mockito: ^2.0.2
    -Used to generate mock classes.
    - Dart Package: <https://pub.dev/packages/mockito>
    - GitHub: <https://github.com/dart-lang/mockito>
    - License: [MIT](https://pub.dev/packages/mockito/license)