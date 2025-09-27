import '../_index.dart';

AppBar myAppBar({
  required BuildContext context,
  required WidgetRef ref,
  List<Widget>? actions,
  Widget? titleText,
}) {
  if (MediaQuery.of(context).size.width > 600) {
    return webAppBar(
      context: context,
      ref: ref,
      actions: actions,
      titleText: titleText,
    );
  } else {
    return mobileAppBar(context: context, ref: ref, titleText: titleText);
  }
}

AppBar webAppBar({
  required BuildContext context,
  required WidgetRef ref,
  List<Widget>? actions,
  Widget? titleText,
}) {
  return AppBar(
    backgroundColor: Colors.transparent, // ✅ 투명
    elevation: 0, // ✅ 그림자 제거
    title: titleText,
    actions: actions,
  );
}

AppBar mobileAppBar({
  required BuildContext context,
  required WidgetRef ref,
  Widget? titleText,
}) {
  return AppBar(
    backgroundColor: Colors.transparent, // ✅ 투명
    elevation: 0, // ✅ 그림자 제거
    title: titleText,
    actions: [
      Builder(
        builder:
            (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
      ),
    ],
  );
}
