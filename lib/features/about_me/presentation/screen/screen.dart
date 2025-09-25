import '../_index.dart';

class AboutMeScreen extends ConsumerWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 빌드가 끝난 뒤 indexStateProvider 업데이트
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(indexStateProvider.notifier).state = IndexState.aboutMe;
    });
    return Container(child: Center(child: Text("about me")));
  }
}
