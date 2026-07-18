# Flutter Localization ARB Format

The `.arb` files (Application Resource Bundle) are used for localization in Flutter.

## Structure

- `app_en.arb` - English strings
- `app_bn.arb` - Bengali strings (Bangla)

## Generating Localized Strings

Run the following command to generate localization files:

```bash
flutter gen-l10n
```

This will generate:
- `lib/generated_plugin_registrant.dart`
- `lib/l10n/app_localizations.dart`
- `lib/l10n/app_localizations_en.dart`
- `lib/l10n/app_localizations_bn.dart`

## Usage in Code

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// In a widget
Text(AppLocalizations.of(context)!.appTitle),

// Get current locale
Locale currentLocale = Localizations.localeOf(context);
```

## Adding New Strings

1. Add the string to `app_en.arb` with the English translation
2. Add the string to `app_bn.arb` with the Bengali translation
3. Run `flutter gen-l10n` to regenerate
4. Use the generated getter in your code
