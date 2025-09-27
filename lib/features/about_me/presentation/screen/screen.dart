import '../_index.dart';

class AboutMeScreen extends ConsumerWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 빌드가 끝난 뒤 indexStateProvider 업데이트
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final notifier = ref.read(indexStateProvider.notifier);
    //   if (notifier.state != IndexState.aboutMe) {
    //     notifier.state = IndexState.aboutMe;
    //   }
    // });
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.white,
        child: Center(child: Text("about me")),
      ),
    );
  }
}
