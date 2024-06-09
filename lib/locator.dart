// ignore_for_file: avoid_annotating_with_dynamic

import 'package:chat_bot_poc/locator.config.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

const fake = Environment('fake');
const real = Environment('real');

@InjectableInit()
Future<GetIt> configureDependencies({Environment environment = real}) =>
    getIt.init(environment: environment.name);

class GetItProvider extends StatefulWidget {
  const GetItProvider({
    required this.getIt,
    required this.child,
    super.key,
  });

  final GetIt getIt;
  final Widget child;

  @override
  State<GetItProvider> createState() => _GetItProviderState();

  static T of<T extends Object>(
    BuildContext context, {
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    final getItWidget =
        context.findRootAncestorStateOfType<_GetItProviderState>();

    assert(getItWidget != null, 'No GetIt found in context');

    return getItWidget!.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }
}

class _GetItProviderState extends State<GetItProvider> {
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return widget.getIt<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

extension GetItContext on BuildContext {
  T getIt<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return GetItProvider.of<T>(
      this,
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }
}
