import '../_index.dart';

Widget endDrawer() {
  return Container(
    color: Colors.white,
    width: 300,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Handle item 1 tap
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Handle item 2 tap
          },
        ),
      ],
    ),
  );
}
