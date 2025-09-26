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
          return MainScaffold(childPath: state.fullPath, child: child);
        },
        routes: [
          GoRoute(
            path: RouterPath.aboutMePath.path,
            name: RouterPath.aboutMePath.name,
            pageBuilder:
                (_, __) => const NoTransitionPage(child: AboutMeScreen()),
          ),
          GoRoute(
            path: RouterPath.tendencyPath.path,
            name: RouterPath.tendencyPath.name,
            pageBuilder:
                (_, __) => const NoTransitionPage(child: TendencyScreen()),
          ),
          GoRoute(
            path: RouterPath.skillPath.path,
            name: RouterPath.skillPath.name,
            pageBuilder:
                (_, __) => const NoTransitionPage(child: SkillScreen()),
          ),
          GoRoute(
            path: RouterPath.projectsPath.path,
            name: RouterPath.projectsPath.name,
            pageBuilder:
                (_, __) => const NoTransitionPage(child: ProjectsScreen()),
          ),
          GoRoute(
            path: RouterPath.appealPointPath.path,
            name: RouterPath.appealPointPath.name,
            pageBuilder:
                (_, __) => const NoTransitionPage(child: AppealPointScreen()),
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
