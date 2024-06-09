import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class FullscreenRoute<T> extends CustomRoute {
  FullscreenRoute({required PageInfo<T> super.page, super.path})
      : super(customRouteBuilder: dialogRouteBuilder);

  static Route<T> dialogRouteBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) =>
      MaterialPageRoute<T>(
        settings: page,
        builder: (context) => child,
        fullscreenDialog: true,
      );
}
