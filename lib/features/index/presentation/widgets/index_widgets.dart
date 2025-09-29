import '../_index.dart';

Widget aboutMeContents(BuildContext context, WidgetRef ref) {
  return Hero(
    tag: ABOUT_ME_HERO_TAG,
    child: GestureDetector(
      onTap:
          () => {ref.read(appRouterProvider).go(RouterPath.aboutMePath.path)},
      child: indexHoverContents(
        delayMs: 300,
        animationType: AppearAnimationType.slideRight,
        child: Text(IndexStrings.aboutMe(context)),
        color: Colors.amberAccent,
      ),
    ),
  );
}

Widget tendencyContents(BuildContext context, WidgetRef ref) {
  return Hero(
    tag: TENDENCY_HERO_TAG,
    child: GestureDetector(
      onTap:
          () => {ref.read(appRouterProvider).go(RouterPath.tendencyPath.path)},
      child: indexHoverContents(
        delayMs: 600,
        animationType: AppearAnimationType.slideDown,
        child: Text(IndexStrings.tendency(context)),
        color: Colors.purpleAccent,
      ),
    ),
  );
}

Widget skillContents(BuildContext context, WidgetRef ref) {
  return Hero(
    tag: SKILL_HERO_TAG,
    child: GestureDetector(
      onTap: () => {ref.read(appRouterProvider).go(RouterPath.skillPath.path)},
      child: indexHoverContents(
        delayMs: 1200,
        animationType: AppearAnimationType.slideUp,
        child: Text(IndexStrings.skill(context)),
        color: Colors.orangeAccent,
      ),
    ),
  );
}

Widget projectsContents(BuildContext context, WidgetRef ref) {
  return Hero(
    tag: PROJECTS_HERO_TAG,
    child: GestureDetector(
      onTap:
          () => {ref.read(appRouterProvider).go(RouterPath.projectsPath.path)},
      child: indexHoverContents(
        delayMs: 900,
        animationType: AppearAnimationType.slideLeft,
        child: Text(IndexStrings.projects(context)),
        color: Colors.greenAccent,
      ),
    ),
  );
}

Widget appealPointContents(BuildContext context, WidgetRef ref) {
  return Hero(
    tag: APPEAL_POINT_HERO_TAG,
    child: GestureDetector(
      onTap:
          () => {
            ref
                .read(appRouterProvider)
                .replace(RouterPath.appealPointPath.path),
          },
      child: indexAnimatedContainer(
        delayMs: 450,
        animationType: AppearAnimationType.fadeIn,
        child: Text(IndexStrings.appealPoint(context)),
        color: Colors.tealAccent,
      ),
    ),
  );
}
