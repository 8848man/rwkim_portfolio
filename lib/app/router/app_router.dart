import './_index.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouterPath.indexPath.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return IndexScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: RouterPath.indexPath.path,
            name: RouterPath.indexPath.name,
            builder: (_, __) => const IndexScreen(),
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: RouterPath.aboutMePath.path,
            name: RouterPath.aboutMePath.name,
            builder: (_, __) => const AboutMeScreen(),
          ),
          GoRoute(
            path: RouterPath.tendencyPath.path,
            name: RouterPath.tendencyPath.name,
            builder: (_, __) => const TentencyScreen(),
          ),
          GoRoute(
            path: RouterPath.skillPath.path,
            name: RouterPath.skillPath.name,
            builder: (_, __) => const SkillScreen(),
          ),
          GoRoute(
            path: RouterPath.projectsPath.path,
            name: RouterPath.projectsPath.name,
            builder: (_, __) => const ProjectsScreen(),
          ),
          GoRoute(
            path: RouterPath.appealPointPath.path,
            name: RouterPath.appealPointPath.name,
            builder: (_, __) => const AppealPointScreen(),
          ),
        ],
      ),
    ],
  );
});
// 로그인 없이 접근 가능한 경로들 (화이트리스트)
// const _publicPaths = [
//   '/login',
//   '/signUp',
//   '/forgot-password',
// ];
final currentLocationProvider = Provider<String>((ref) {
  final router = ref.watch(appRouterProvider);
  print('test001');
  return router.state.name ?? '/';
});
