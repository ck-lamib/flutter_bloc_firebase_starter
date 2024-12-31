import 'dart:async';

// This is the blue-print class for use cases.
abstract class UseCase<ReturnType, Params> {
  FutureOr<ReturnType> execute(Params params);
}
