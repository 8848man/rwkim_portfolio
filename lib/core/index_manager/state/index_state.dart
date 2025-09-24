import 'package:rw_portfolio/app/router/public.dart';

import '../_index.dart';

enum IndexState {
  aboutMe('aboutMe', 0),
  tendency('tendency', 1),
  skill('skill', 2),
  projects('projects', 3),
  appealPoint('appealPoint', 4);

  const IndexState(this.name, this.idx);
  final String name;
  final int idx;
}

final indexStateProvider = StateProvider<IndexState>((ref) {
  final router = ref.watch(appRouterProvider);
  return IndexState.values.firstWhere(
    (state) => state.name == router.state.name,
  );
});
