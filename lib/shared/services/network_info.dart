import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@injectable
class NetworkInfo {
  NetworkInfo(this._internetConnectionChecker);

  @factoryMethod
  factory NetworkInfo.create() {
    return NetworkInfo(InternetConnectionChecker());
  }

  final InternetConnectionChecker _internetConnectionChecker;

  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

  Stream<bool> get connectionStream =>
      _internetConnectionChecker.onStatusChange.transform(
        StreamTransformer.fromHandlers(
          handleData: (InternetConnectionStatus status, EventSink<bool> sink) {
            sink.add(status != InternetConnectionStatus.connected);
          },
        ),
      );
}
