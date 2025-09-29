import 'package:rw_portfolio/features/tendency/presentation/widgets/first_section.dart';

import '../_index.dart';

class TendencyWebScreen extends ConsumerWidget {
  const TendencyWebScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(children: [TendencyFirstSection()]),
    );
  }
}
