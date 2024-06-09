import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';

dynamic env(String key) => EnvironmentManager().get(key);

String envString(String key) => EnvironmentManager().get(key) as String;

bool envBool(String key) => EnvironmentManager().get(key) as bool;

@visibleForTesting
void testLoad(String environment) {
  EnvironmentManager().testLoad(environment);
}

class EnvironmentManager {
  factory EnvironmentManager() => _instance;

  EnvironmentManager._internal();

  static final EnvironmentManager _instance = EnvironmentManager._internal();

  static final DotEnv _dotEnv = DotEnv();

  Future<void> load({
    String fileName = 'assets/env',
    Map<String, String> mergeWith = const {},
  }) async {
    await _dotEnv.load(
      fileName: fileName,
      mergeWith: mergeWith,
    );
  }

  @visibleForTesting
  void testLoad(String fileInput) {
    _dotEnv.testLoad(
      fileInput: fileInput,
    );
  }

  dynamic get(String key) {
    final value = _dotEnv.env[key];

    if (value is String && value.toLowerCase() == 'true') {
      return true;
    }

    if (value is String && value.toLowerCase() == 'false') {
      return false;
    }

    return value;
  }
}
