import '../_index.dart';

class SkillScreen extends ConsumerWidget {
  const SkillScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(indexStateProvider.notifier).state = IndexState.skill;
    });
    return Container();
  }
}
