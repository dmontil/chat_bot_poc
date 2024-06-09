import 'package:chat_bot_poc/shared/exceptions/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'load_state.freezed.dart';

@freezed
abstract class LoadState<T> with _$LoadState<T> {
  const factory LoadState.loading() = _Loading;

  const factory LoadState.error(Failure error) = _Error;

  const factory LoadState.empty() = _Empty;

  const factory LoadState.success(T list) = _Success;

  const LoadState._();

  bool get isLoading => this is _Loading;

  bool get isError => this is _Error;

  bool get isEmpty => this is _Empty;

  bool get isSuccess => this is _Success;

  T get data => (this as _Success<T>).list;

  Failure get error => (this as _Error).error;
}
