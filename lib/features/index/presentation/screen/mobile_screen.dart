import '../_index.dart';

class IndexMobileScreen extends ConsumerWidget {
  const IndexMobileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          aboutMeContents(context, ref).sizedBox(height: 300),
          tendencyContents(context, ref).sizedBox(height: 300),
          skillContents(context, ref).sizedBox(height: 300),
          projectsContents(context, ref).sizedBox(height: 300),
          appealPointContents(context, ref).sizedBox(height: 300),
        ],
      ),
    );
  }
}
