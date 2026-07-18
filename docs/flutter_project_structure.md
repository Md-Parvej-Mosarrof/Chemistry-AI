# Chemistry Learning App — Flutter Architecture Blueprint

A production-ready, feature-based Clean Architecture setup using **Riverpod**, **GoRouter**, **localization (EN + second language)**, **theme management**, and **offline-first** data access, with a full test pyramid.

---

## 1. Top-Level Project Structure

```
chemistry_app/
├── android/
├── ios/
├── assets/
│   ├── images/
│   ├── icons/
│   ├── lottie/
│   └── fonts/
├── lib/
│   ├── main.dart
│   ├── main_dev.dart
│   ├── main_prod.dart
│   ├── app/
│   ├── core/
│   ├── features/
│   └── l10n/
├── test/
├── integration_test/
├── l10n.yaml
├── pubspec.yaml
└── analysis_options.yaml
```

### Why this shape?
- `app/` holds app-wide wiring (router, theme, root widget) — separate from business logic.
- `core/` holds cross-cutting, feature-agnostic code (network, db, utils, error handling, shared widgets).
- `features/` holds one folder per domain feature, each internally following Clean Architecture (data / domain / presentation).
- `l10n/` holds ARB translation files consumed by Flutter's codegen.
- Multiple entry points (`main_dev.dart`, `main_prod.dart`) support flavors (dev/staging/prod) without duplicating app logic.

---

## 2. Root Files

| File | Purpose |
|---|---|
| `main.dart` | Default entry point; usually just calls `main_prod.dart` or bootstraps directly for simple builds. |
| `main_dev.dart` | Boots app with dev config (mock APIs, verbose logging, dev Firebase project). |
| `main_prod.dart` | Boots app with production config. |
| `l10n.yaml` | Configures `flutter gen-l10n`: arb-dir, output-dir, template file, class name. |
| `pubspec.yaml` | Dependencies, assets, fonts, flavor scripts. |
| `analysis_options.yaml` | Lint rules (use `very_good_analysis` or `flutter_lints` + custom rules) — enforced in CI. |

---

## 3. `lib/app/` — Application Shell

```
app/
├── app.dart                     # Root MaterialApp.router widget
├── app_bootstrap.dart           # Shared init logic (Hive, DI overrides, error handlers)
├── router/
│   ├── app_router.dart          # GoRouter configuration & route table
│   ├── router_provider.dart     # Riverpod provider exposing GoRouter instance
│   ├── route_paths.dart         # Centralized route path/name constants
│   └── route_guards.dart        # Auth/onboarding redirect logic
└── theme/
    ├── app_theme.dart           # ThemeData factories (light/dark)
    ├── app_colors.dart          # Color palette (chemistry-brand colors, periodic table accent colors)
    ├── app_text_styles.dart     # Typography scale
    ├── app_spacing.dart         # Spacing/radius/elevation constants
    └── theme_provider.dart      # Riverpod StateNotifier/Notifier for theme mode (light/dark/system), persisted
```

### Explanation
- **`app.dart`**: The single `ConsumerWidget` at the top of the tree. Wires `MaterialApp.router` to `routerProvider`, `themeProvider`, and `AppLocalizations.delegates`. Keeping this thin means the rest of the app never touches `MaterialApp` directly.
- **`app_bootstrap.dart`**: Runs before `runApp()` — initializes Hive/Isar boxes, `SharedPreferences`, error reporting (Sentry/Crashlytics), and wraps everything in `ProviderScope` with any environment overrides.
- **`router/app_router.dart`**: Declares `GoRoute`s per feature (imports each feature's route file rather than hardcoding), keeping router config feature-driven.
- **`route_guards.dart`**: Centralizes `redirect:` logic (e.g., force onboarding on first launch, block premium quiz routes without unlock).
- **`theme/theme_provider.dart`**: A `Notifier<ThemeMode>` backed by local storage so theme choice survives restarts — critical for an offline-first app since we never depend on network state to render UI.

---

## 4. `lib/core/` — Shared Infrastructure

```
core/
├── constants/
│   ├── app_constants.dart
│   ├── asset_paths.dart
│   └── storage_keys.dart
├── network/
│   ├── dio_client.dart
│   ├── network_info.dart          # Connectivity checker (connectivity_plus)
│   ├── api_endpoints.dart
│   └── interceptors/
│       ├── auth_interceptor.dart
│       └── logging_interceptor.dart
├── database/
│   ├── hive_service.dart          # or isar_service.dart
│   ├── database_provider.dart
│   └── sync/
│       ├── sync_queue.dart        # Pending offline mutations queue
│       └── sync_service.dart      # Background sync when connectivity returns
├── error/
│   ├── failures.dart               # Sealed Failure classes (ServerFailure, CacheFailure, etc.)
│   ├── exceptions.dart             # Custom exceptions thrown by data layer
│   └── error_handler.dart
├── usecase/
│   └── usecase.dart                # Abstract UseCase<Type, Params> base class
├── utils/
│   ├── either_extensions.dart      # dartz/fpdart helpers
│   ├── logger.dart
│   ├── validators.dart
│   └── formatters.dart             # e.g., formatting chemical formulas, units
├── widgets/
│   ├── app_scaffold.dart
│   ├── loading_indicator.dart
│   ├── error_view.dart
│   ├── offline_banner.dart         # Persistent "You're offline" indicator
│   └── molecule_viewer_placeholder.dart
└── providers/
    ├── shared_prefs_provider.dart
    ├── dio_provider.dart
    └── connectivity_provider.dart
```

### Explanation
- **`network/network_info.dart`**: Wraps `connectivity_plus`; exposed via Riverpod stream provider so any repository can check `isConnected` before deciding cache-vs-remote.
- **`database/hive_service.dart`**: Encapsulates box opening/registration of Hive `TypeAdapter`s (or Isar collections) for offline persistence of lessons, quizzes, progress.
- **`database/sync/`**: The heart of "offline-ready" — mutations made offline (e.g., quiz answers, bookmarks) are queued locally and replayed via `sync_service.dart` once connectivity is restored, using a simple outbox pattern.
- **`error/failures.dart`**: Defines a `Failure` sealed class hierarchy so the domain layer never leaks `DioException` or `HiveError` upward — repositories map exceptions → failures.
- **`usecase/usecase.dart`**: A generic contract (`Future<Either<Failure, T>> call(Params params)`) every feature's use cases implement, keeping call sites uniform.
- **`widgets/offline_banner.dart`**: A reusable widget shown app-wide when `connectivityProvider` reports offline — reinforces the offline-first UX promise.

---

## 5. `lib/features/` — Feature Modules (Clean Architecture per feature)

Each feature is self-contained with **data / domain / presentation** layers. Example: `periodic_table`, `lessons`, `quizzes`, `flashcards`, `progress`, `auth`, `onboarding`, `settings`.

### Example: `features/lessons/`

```
features/lessons/
├── data/
│   ├── datasources/
│   │   ├── lessons_remote_datasource.dart
│   │   └── lessons_local_datasource.dart
│   ├── models/
│   │   └── lesson_model.dart          # extends domain entity, has fromJson/toJson + Hive adapter
│   └── repositories/
│       └── lessons_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── lesson.dart                # Pure Dart class, no JSON/Hive dependency
│   ├── repositories/
│   │   └── lessons_repository.dart    # Abstract contract
│   └── usecases/
│       ├── get_lessons.dart
│       ├── get_lesson_by_id.dart
│       └── bookmark_lesson.dart
├── presentation/
│   ├── providers/
│   │   ├── lessons_list_provider.dart      # AsyncNotifier fetching lesson list
│   │   ├── lesson_detail_provider.dart
│   │   └── lessons_repository_provider.dart # DI wiring: binds impl to interface
│   ├── screens/
│   │   ├── lessons_list_screen.dart
│   │   └── lesson_detail_screen.dart
│   ├── widgets/
│   │   ├── lesson_card.dart
│   │   ├── lesson_progress_bar.dart
│   │   └── molecule_diagram.dart
│   └── routes/
│       └── lessons_routes.dart        # GoRoute list, imported into app_router.dart
└── lessons.dart                       # Barrel file exporting public API of the feature
```

### Layer-by-layer explanation

**`data/datasources/`**
- `lessons_remote_datasource.dart`: Talks to the API via `dio_client.dart`; throws `ServerException` on failure.
- `lessons_local_datasource.dart`: Reads/writes the Hive box for lessons; throws `CacheException` on failure. This is what makes lesson content available fully offline after first sync.

**`data/models/lesson_model.dart`**
- A `LessonModel extends Lesson` with `fromJson`/`toJson` and a `@HiveType` adapter. Keeps serialization concerns out of the domain entity (Clean Architecture's core rule: domain has zero knowledge of JSON or Hive).

**`data/repositories/lessons_repository_impl.dart`**
- Implements the domain's `LessonsRepository` interface.
- Contains the **offline-first policy**: check `NetworkInfo.isConnected` → if online, fetch remote, cache locally, return; if offline, return cached data wrapped in `Right(...)`, or `Left(CacheFailure())` if nothing cached yet.

**`domain/entities/lesson.dart`**
- Plain Dart object (`id`, `title`, `bodyRichText`, `moleculeAssets`, `difficulty`) — this is what the UI and use cases operate on. No `Equatable`/Hive/JSON coupling required, though `Equatable` is fine since it's still framework-agnostic.

**`domain/repositories/lessons_repository.dart`**
- Abstract interface (`Future<Either<Failure, List<Lesson>>> getLessons()`), the dependency-inversion boundary the data layer must satisfy.

**`domain/usecases/`**
- One class per business action, each with a single `call()` method. Keeps business rules testable in isolation without touching Riverpod or widgets.

**`presentation/providers/`**
- `lessons_repository_provider.dart`: The DI binding — `Provider<LessonsRepository>((ref) => LessonsRepositoryImpl(remote, local, networkInfo))`. This is the **only** place concrete implementations are chosen, so tests can override it trivially.
- `lessons_list_provider.dart`: An `AsyncNotifier<List<Lesson>>` calling the `GetLessons` use case; screens just `ref.watch` this.

**`presentation/screens/` & `widgets/`**
- Screens are route-level pages; `widgets/` holds feature-scoped composable UI (a `lesson_card.dart` is only meaningful within lessons, so it doesn't belong in `core/widgets`).

**`presentation/routes/lessons_routes.dart`**
- Exports a `List<RouteBase>` that `app_router.dart` spreads into the main route table — this keeps route ownership with the feature, not the app shell.

**`lessons.dart` (barrel file)**
- Re-exports only what other features/app-shell need (e.g., `lessons_routes.dart`, key providers), enforcing feature encapsulation — nothing reaches into another feature's `data/` folder directly.

Repeat this exact shape for: `periodic_table/`, `quizzes/`, `flashcards/`, `progress/`, `auth/`, `onboarding/`, `settings/`.

---

## 6. `lib/l10n/` — Localization

```
l10n/
├── app_en.arb          # Template (source of truth), e.g. English
├── app_bn.arb          # Second language, e.g. Bengali (bilingual requirement)
└── gen/                # Auto-generated by `flutter gen-l10n` (git-ignored)
```

- `l10n.yaml` at root configures:
  ```yaml
  arb-dir: lib/l10n
  template-arb-file: app_en.arb
  output-localization-file: app_localizations.dart
  output-class: AppLocalizations
  ```
- Every ARB key is namespaced logically, e.g. `"periodicTableTitle"`, `"quizScoreLabel"`, `"elementSymbolHint"` — chemistry terms (element names, unit labels like "mol", "g/mol") are localized too, not just UI chrome.
- A `localeProvider` (in `app/theme/` sibling, e.g. `app/locale/locale_provider.dart`) persists the chosen language in `SharedPreferences`, same pattern as `theme_provider.dart`, so language choice works offline and survives restarts.

---

## 7. Testing Structure

```
test/
├── core/
│   ├── network/network_info_test.dart
│   └── database/hive_service_test.dart
├── features/
│   └── lessons/
│       ├── data/
│       │   ├── lessons_repository_impl_test.dart
│       │   └── lesson_model_test.dart
│       ├── domain/
│       │   └── usecases/get_lessons_test.dart
│       └── presentation/
│           └── lessons_list_provider_test.dart
├── helpers/
│   ├── test_helpers.dart        # Mock registration (mocktail), fixture loaders
│   └── fixtures/
│       └── lesson_fixture.json
└── widget/
    └── lessons_list_screen_test.dart

integration_test/
├── app_test.dart                 # Full user flow: launch → onboarding → take a quiz
└── offline_mode_test.dart        # Simulate airplane mode, verify cached lessons load
```

### Explanation
- **Unit tests** (`domain/usecases`, `data/repositories`): Test business logic and offline-fallback branching with `mocktail` mocking the repository/datasource interfaces — no widgets, no Riverpod needed here.
- **Provider tests** (`presentation/.../*_provider_test.dart`): Use `ProviderContainer` with overrides to test `AsyncNotifier` state transitions (loading → data/error) without rendering UI.
- **Widget tests**: Pump screens inside `ProviderScope(overrides: [...])` + `MaterialApp.router` with a test `GoRouter`, verifying UI reacts correctly to provider states (including the offline banner).
- **Integration tests**: Run on a real/emulated device, covering true end-to-end flows, including toggling connectivity to validate the offline-sync path actually works.
- **`fixtures/`**: Canned JSON responses so datasource/model tests don't depend on network fakes being reinvented per test.

---

## 8. Key Package Choices

| Concern | Package |
|---|---|
| State management | `flutter_riverpod`, `riverpod_annotation` (+ `riverpod_generator` for codegen) |
| Routing | `go_router` |
| Localization | `flutter_localizations`, `intl`, codegen via `flutter gen-l10n` |
| Offline storage | `hive` + `hive_flutter` (or `isar` for more complex queries) |
| Networking | `dio` |
| Connectivity | `connectivity_plus` |
| Functional error handling | `fpdart` or `dartz` (`Either<Failure, T>`) |
| Testing | `flutter_test`, `mocktail`, `riverpod_test` patterns via `ProviderContainer` |
| Codegen | `build_runner`, `freezed` (for entities/models), `json_serializable` |

---

## 9. Why This Structure Scales

1. **Feature isolation** — a new feature (e.g., `lab_simulations/`) is added without touching existing ones; only `app_router.dart` gets one new import line.
2. **Testability** — every layer depends on abstractions (`Repository` interfaces, `UseCase` base class), so mocking is trivial and tests stay fast.
3. **Offline-first by construction** — `NetworkInfo` + local datasource + sync queue are baked into the repository layer, not bolted on later.
4. **Riverpod as the sole DI/state mechanism** — no `GetIt` + `Provider` duplication; overrides in tests are one-liners.
5. **GoRouter with feature-owned routes** — avoids a monolithic router file as the app grows toward dozens of screens.
6. **Localization treated as first-class data** — chemistry terms and units are localized like any other string, not hardcoded in English.

---

## 10. Suggested Build Order

1. `core/` (network, database, error, providers) — the foundation everything else depends on.
2. `app/` shell with a placeholder home route — confirms router + theme + localization wiring works.
3. One vertical feature slice end-to-end (e.g., `onboarding/`) to validate the Clean Architecture pattern before replicating it.
4. `lessons/`, `periodic_table/`, `quizzes/`, `flashcards/`, `progress/` — the core learning features, each as a full data/domain/presentation slice.
5. `auth/` and `settings/` (including language/theme toggles).
6. Sync service + offline banner wired globally.
7. Test pyramid filled in alongside each feature (not after) to keep coverage honest.