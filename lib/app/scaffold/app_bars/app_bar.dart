import '../_index.dart';

AppBar myAppBar({
  required BuildContext context,
  required WidgetRef ref,
  List<Widget>? actions,
  String? title,
}) {
  if (MediaQuery.of(context).size.width > 600) {
    return webAppBar(
      context: context,
      ref: ref,
      actions: actions,
      title: title,
    );
  } else {
    return mobileAppBar(context, ref, title: title);
  }
}

AppBar webAppBar({
  required BuildContext context,
  required WidgetRef ref,
  List<Widget>? actions,
  String? title,
}) {
  return AppBar(
    backgroundColor: Colors.transparent, // ✅ 투명
    elevation: 0, // ✅ 그림자 제거
    title: Text(title ?? "Title"),
    actions: actions,
  );
}

AppBar mobileAppBar(BuildContext context, WidgetRef ref, {String? title}) {
  return AppBar(
    backgroundColor: Colors.transparent, // ✅ 투명
    elevation: 0, // ✅ 그림자 제거
    title: Text(title ?? "Title"),
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
