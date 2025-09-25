import '../_index.dart';

class TendencyScreen extends ConsumerWidget {
  const TendencyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(indexStateProvider.notifier).state = IndexState.tendency;
    });
    return Container();
  }
}
