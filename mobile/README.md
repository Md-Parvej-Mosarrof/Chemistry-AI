# Flutter Mobile App - Chemistry Learning

## Project Structure

```
mobile/
├── lib/
│   ├── main.dart                      # App entry point
│   ├── bootstrap.dart                 # App initialization
│   ├── core/                          # Shared across features
│   │   ├── constants/                 # App constants
│   │   ├── error/                     # Exceptions & failures
│   │   ├── network/                   # HTTP client (Dio)
│   │   ├── theme/                     # Colors, typography, themes
│   │   ├── localization/              # i18n/l10n support
│   │   ├── routing/                   # GoRouter configuration
│   │   ├── usecase/                   # Abstract use case base
│   │   └── utils/                     # Extensions & helpers
│   └── features/                      # Feature-first architecture
│       ├── auth/
│       ├── chapters/
│       ├── quiz/
│       ├── ai_tutor/
│       └── profile/
├── assets/
│   ├── images/                        # Icons, illustrations
│   └── fonts/                         # Custom fonts
├── test/                              # Unit & widget tests
├── pubspec.yaml                       # Dependencies & config
├── analysis_options.yaml              # Linting rules
└── .gitignore

## Getting Started

### Prerequisites

- Flutter 3.x+
- Dart 3.x+
- iOS 12+ or Android 5.0+

### Installation

1. **Get dependencies**
   ```bash
   flutter pub get
   ```

2. **Generate code (including localization)**
   ```bash
   flutter gen-l10n
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Development

- **Check code style**
  ```bash
  flutter analyze
  ```

- **Format code**
  ```bash
  dart format lib/ test/
  ```

- **Run tests**
  ```bash
  flutter test
  ```

- **Build for production**
  ```bash
  flutter build apk       # Android
  flutter build ios       # iOS
  flutter build macos     # macOS
  flutter build windows   # Windows
  flutter build linux     # Linux
  flutter build web       # Web
  ```

## Architecture

### Clean Architecture Layers

1. **Presentation Layer** - UI widgets & state management (Riverpod)
2. **Domain Layer** - Business logic & entities (use cases)
3. **Data Layer** - Repositories & data sources (API, local storage)

### State Management

- **Riverpod**: Type-safe, testable state management
- **Riverpod Generator**: Code generation for providers

### Routing

- **GoRouter**: Modern declarative routing with navigation

### Localization

- **ARB Format**: Standard localization files
- **Supported Languages**: English (en), Bengali (bn)

## Key Dependencies

- `flutter_riverpod` - State management
- `go_router` - Navigation
- `dio` - HTTP client
- `freezed_annotation` - Immutable data classes
- `json_annotation` - JSON serialization
- `intl` - Internationalization

## Code Style

- Use `const` constructors whenever possible
- Follow Dart naming conventions (camelCase for variables, PascalCase for types)
- Use final for variables that don't change
- Include documentation for public APIs
- Write unit tests for business logic
