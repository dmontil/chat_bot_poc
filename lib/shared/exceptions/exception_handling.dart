import 'dart:async';
import 'dart:io';

import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:chat_bot_poc/shared/exceptions/log.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';

/// Report an exception
void report(
  Object exception, [
  StackTrace? stackTrace,
]) {
  if (Platform.environment.containsKey('FLUTTER_TEST')) {
    return;
  }

  // Sentry.captureException(
  //   exception,
  //   stackTrace: stackTrace,
  // );

  if (kDebugMode) {
    printLog('Reported exception: $exception\n$stackTrace');
  }
}

/// Transform a function into an Either, catching
/// any exception or error and reporting it.
Either<Failure, T> tryCatch<T>(
  T Function() fn, {
  void Function(Object)? onFail,
  void Function()? onFinally,
  Failure Function(Object)? mapFailure,
}) =>
    _tryCatch(
      () => Right(fn()),
      onFail: onFail,
      onFinally: onFinally,
      mapFailure: mapFailure,
    );

extension FutureTryCatchExtension<T> on Future<T> {
  /// Transform a Future into an Either, catching
  /// any exception or error and reporting it.
  Future<Either<Failure, S>> tryCatch<S>(
    FutureOr<S> Function(T) fn, {
    void Function(Object)? onFail,
    void Function(T?)? onFinally,
    Failure Function(Object)? mapFailure,
  }) async =>
      _tryCatchAsync(
        this,
        (value) async => Right(await fn(value)),
        onFail: onFail,
        onFinally: (value) => onFinally?.call(value),
        mapFailure: mapFailure,
      );
}

extension EitherTryCatchExtension<R> on Either<Failure, R> {
  /// Transform an Either into other Either, catching
  /// any exception or error and reporting it.
  Either<Failure, T> tryCatch<T>(
    Either<Failure, T> Function(Either<Failure, R>) fn, {
    void Function(Object)? onFail,
    void Function(Either<Failure, R>)? onFinally,
    Failure Function(Object)? mapFailure,
  }) {
    return _tryCatch(
      () => fn(this),
      onFail: onFail,
      onFinally: () => onFinally?.call(this),
      mapFailure: mapFailure,
    );
  }
}

extension FutureEitherTryCatchExtension<R> on Future<Either<Failure, R>> {
  /// Transform a Future<Either> into other Future<Either>, catching
  /// any exception or error and reporting it.
  Future<Either<Failure, T>> tryCatch<T>(
    FutureOr<Either<Failure, T>> Function(Either<Failure, R>) fn, {
    void Function(Object)? onFail,
    void Function(Either<Failure, R>?)? onFinally,
    Failure Function(Object)? mapFailure,
  }) =>
      _tryCatchAsync(
        this,
        (value) => fn(value),
        onFail: onFail,
        onFinally: (value) => onFinally?.call(value),
        mapFailure: mapFailure,
      );
}

Failure _defaultMapFailure(Object error) => UnknownFailure();

Either<Failure, T> _tryCatch<T>(
  Either<Failure, T> Function() fn, {
  void Function(Object)? onFail,
  void Function()? onFinally,
  Failure Function(Object)? mapFailure,
}) {
  try {
    return fn();
  } on Exception catch (exception, stackTrace) {
    onFail?.call(exception);
    report(exception, stackTrace);
    return Left(mapFailure?.call(exception) ?? _defaultMapFailure(exception));
  }
  // ignore: avoid_catching_errors
  on Error catch (error, stackTrace) {
    onFail?.call(error);
    report(error, stackTrace);
    return Left(mapFailure?.call(error) ?? _defaultMapFailure(error));
  } finally {
    onFinally?.call();
  }
}

Future<Either<Failure, T>> _tryCatchAsync<T, S>(
  Future<S> future,
  FutureOr<Either<Failure, T>> Function(S) fn, {
  void Function(Object)? onFail,
  void Function(S?)? onFinally,
  Failure Function(Object)? mapFailure = _defaultMapFailure,
}) async {
  S? value;
  try {
    value = await future;
    return await fn(value as S);
  } on Exception catch (exception, stackTrace) {
    onFail?.call(exception);
    report(exception, stackTrace);
    return Left(mapFailure?.call(exception) ?? _defaultMapFailure(exception));
  }
  // ignore: avoid_catching_errors
  on Error catch (error, stackTrace) {
    onFail?.call(error);
    report(error, stackTrace);
    return Left(mapFailure?.call(error) ?? _defaultMapFailure(error));
  } finally {
    onFinally?.call(value);
  }
}
