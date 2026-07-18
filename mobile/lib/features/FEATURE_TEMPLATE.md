# Example Feature: Auth

This is a template for creating new features following the Flutter clean architecture.

## Folder Structure

```
auth/
├── data/
│   ├── datasources/
│   │   ├── auth_remote_datasource.dart
│   │   └── auth_local_datasource.dart
│   ├── models/
│   │   └── user_model.dart
│   └── repositories/
│       └── auth_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── user_entity.dart
│   ├── repositories/
│   │   └── auth_repository.dart
│   └── usecases/
│       ├── login_usecase.dart
│       ├── signup_usecase.dart
│       └── logout_usecase.dart
└── presentation/
    ├── controllers/
    │   └── auth_controller.dart
    ├── pages/
    │   ├── login_page.dart
    │   ├── signup_page.dart
    │   └── forgot_password_page.dart
    ├── widgets/
    │   ├── email_input_field.dart
    │   ├── password_input_field.dart
    │   └── auth_button.dart
    └── state/
        └── auth_state.freezed.dart
```

## Implementation Steps

1. **Define Entity** - Pure Dart class without dependencies
2. **Create Repository Contract** - Abstract class defining the interface
3. **Implement Remote DataSource** - API calls using Dio
4. **Implement Local DataSource** - Local caching (SharedPreferences, Hive)
5. **Implement Repository** - Combines data sources, handles errors
6. **Create Use Cases** - Each use case has one responsibility
7. **Create State** - Using Freezed for immutability
8. **Create Provider** - Riverpod provider for state management
9. **Create UI** - Pages and widgets

## Example: Login Use Case

```dart
// domain/usecases/login_usecase.dart
class LoginUseCase extends UseCase<User, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
```

## Example: Riverpod Provider

```dart
// presentation/controllers/auth_controller.dart
final loginProvider = StateNotifierProvider.autoDispose<
    LoginNotifier,
    AsyncValue<void>
>((ref) {
  final useCase = ref.watch(loginUseCaseProvider);
  return LoginNotifier(useCase);
});

class LoginNotifier extends StateNotifier<AsyncValue<void>> {
  final LoginUseCase _useCase;

  LoginNotifier(this._useCase) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    final result = await _useCase(
      LoginParams(email: email, password: password),
    );
    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}
```
