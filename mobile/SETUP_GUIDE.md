# Project structure initialization

This project follows Clean Architecture with Feature-First approach.

## Next Steps

### 1. Install Dependencies
```bash
cd mobile
flutter pub get
flutter gen-l10n
flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. Create Your First Feature

See `lib/features/FEATURE_TEMPLATE.md` for the structure:

```bash
# Example: Creating Auth feature
mkdir -p lib/features/auth/{data,domain,presentation}
```

### 3. Generate Code for Data Models

```bash
# Install freezed and json_serializable
flutter pub add -d freezed
flutter pub add freezed_annotation json_annotation
flutter pub add -d json_serializable

# Generate code
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Test Your Setup

```bash
# Run linter
flutter analyze

# Format code
dart format lib/ test/

# Run tests
flutter test

# Run app
flutter run
```

## File Organization Quick Reference

- **lib/main.dart** - App entry point
- **lib/bootstrap.dart** - App initialization logic
- **lib/core/** - Shared resources (theme, routing, network, error handling)
- **lib/features/** - Feature modules (each with data/domain/presentation)
- **assets/** - Images, fonts, and other static assets
- **test/** - Unit and widget tests

## Available Core Utilities

- **app_constants.dart** - App-wide constants
- **app_theme.dart** - Material Design theme configuration
- **app_colors.dart** - Color palette
- **app_text_styles.dart** - Typography definitions
- **dio_client.dart** - Pre-configured HTTP client
- **exceptions.dart** - Error types
- **failures.dart** - Result type for error handling
- **extensions.dart** - Dart and Flutter extensions
- **app_router.dart** - GoRouter configuration
- **usecase.dart** - Abstract base for use cases

## Architecture Patterns

### Data Layer
- **DataSources** - Remote (API) and Local (cache) data access
- **Repositories** - Combine data sources, map to entities
- **Models** - API/DB response models (with json serialization)

### Domain Layer
- **Entities** - Pure Dart business logic objects
- **Repositories** - Abstract repository interfaces
- **UseCases** - Application business rules (one responsibility each)

### Presentation Layer
- **Controllers** - State management (Riverpod providers)
- **Pages** - Full screen widgets
- **Widgets** - Reusable UI components
- **State** - UI state management (using Freezed)

## Localization

Supported languages:
- English (en) - app_en.arb
- Bengali (bn) - app_bn.arb

Add new strings to both .arb files, then run:
```bash
flutter gen-l10n
```
