import 'package:fpdart/fpdart.dart';
import '../error/failures.dart';

/// Abstract base class for use cases
///
/// Use cases encapsulate business logic and are independent of:
/// - UI frameworks
/// - Backend API details
/// - Database implementations
///
/// They take input as parameters and return Either<Failure, SuccessType>
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case for operations that don't require parameters
abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}

/// Parameters that use cases receive
class NoParams {
  const NoParams();
}
