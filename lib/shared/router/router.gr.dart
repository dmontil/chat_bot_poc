// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:chat_bot_poc/features/chat/presentation/pages/chat_page.dart'
    as _i1;
import 'package:chat_bot_poc/features/home/presentation/pages/home_page.dart'
    as _i2;
import 'package:chat_bot_poc/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ChatRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChatRouteArgs>(
          orElse: () =>
              ChatRouteArgs(chatProvider: pathParams.getInt('chatProvider')));
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ChatPage(
          chatProvider: args.chatProvider,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChatPage]
class ChatRoute extends _i4.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required int chatProvider,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            chatProvider: chatProvider,
            key: key,
          ),
          rawPathParams: {'chatProvider': chatProvider},
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i4.PageInfo<ChatRouteArgs> page =
      _i4.PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    required this.chatProvider,
    this.key,
  });

  final int chatProvider;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{chatProvider: $chatProvider, key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i4.PageRouteInfo<void> {
  const OnboardingRoute({List<_i4.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
