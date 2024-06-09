import 'package:auto_route/auto_route.dart';
import 'package:chat_bot_poc/features/chat/presentation/routes.dart' as chat;
import 'package:chat_bot_poc/features/home/presentation/routes.dart' as home;
import 'package:chat_bot_poc/shared/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Dialog,Route')
class AppRouter extends $AppRouter {
  AppRouter({this.isOnboardingCompleted = false});

  final bool isOnboardingCompleted;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/',
          page: isOnboardingCompleted ? HomeRoute.page : OnboardingRoute.page,
        ),
        if (!isOnboardingCompleted) ...[
          ...home.routes,
        ],
        ...chat.routes,
      ];
}
