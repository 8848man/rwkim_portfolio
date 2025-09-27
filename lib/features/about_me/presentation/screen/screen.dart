import '../_index.dart';

class AboutMeScreen extends ConsumerWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: mediaWidth,
            height: mediaHeight,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.white,
                child: Center(child: Text("about me")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
