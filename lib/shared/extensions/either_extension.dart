import 'dart:async';

import 'package:either_dart/either.dart';

// Also check lib/shared/exception_handling.dart

extension EitherExtension<L, R> on Either<L, R> {
  /// Run function when [Either] is [Right] and return the same [Either]
  Either<L, R> when(void Function(R right) fnR) => map((right) {
        fnR(right);
        return right;
      });

  /// Run function when [Either] is [Left] and return the same [Either]
  Either<L, R> whenLeft(void Function(L left) fnL) => mapLeft((left) {
        fnL(left);
        return left;
      });
}

extension FutureEitherExtension<L, R> on Future<Either<L, R>> {
  /// Run function when [Either] is [Right] and
  /// return the same Future of [Either]
  Future<Either<L, R>> whenRight(FutureOr<void> Function(R right) fnR) =>
      then((either) => either.mapAsync((right) async {
            await fnR(right);
            return Future.value(right);
          }));

  /// Run function when [Either] is [Left] and
  /// return the same Future of [Either]
  Future<Either<L, R>> whenLeft(FutureOr<void> Function(L left) fnL) =>
      then((either) => either.mapLeftAsync((left) async {
            await fnL(left);
            return Future.value(left);
          }));
}
