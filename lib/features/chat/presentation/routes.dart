import 'package:auto_route/auto_route.dart';
import 'package:chat_bot_poc/shared/router/router.gr.dart';

final routes = [
  AutoRoute(
    path: '/chat/:chatProvider',
    page: ChatRoute.page,
  ),
];
