import './_index.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouterPath.home.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return HomeScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: RouterPath.home.path,
            name: RouterPath.home.name,
            builder: (_, __) => const HomeScreen(),
          ),
          // GoRoute(
          //   path: RouterPath.signUp.path,
          //   name: RouterPath.signUp.name,
          //   builder: (_, __) => const SignUpScreen(),
          // ),
        ],
      ),
      // ShellRoute(
      //   builder: (context, state, child) {
      //     return HomeScaffold(child: child);
      //   },
      //   routes: [
      //     GoRoute(
      //       path: RouterPath.dashboard.path,
      //       name: RouterPath.dashboard.name,
      //       builder: (_, __) => const DashboardScreen(),
      //     ),
      //     GoRoute(
      //       path: RouterPath.lesson.path,
      //       name: RouterPath.lesson.name,
      //       builder: (_, __) => const LessonScreen(),
      //     ),
      //     GoRoute(
      //       path: RouterPath.life.path,
      //       name: RouterPath.life.name,
      //       builder: (_, __) => const LifeScreen(),
      //     ),
      //     GoRoute(
      //       path: RouterPath.statistics.path,
      //       name: RouterPath.statistics.name,
      //       builder: (_, __) => const StatisticsScreen(),
      //     ),
      //   ],
      // ),
    ],
  );
});
// 로그인 없이 접근 가능한 경로들 (화이트리스트)
// const _publicPaths = [
//   '/login',
//   '/signUp',
//   '/forgot-password',
// ];
