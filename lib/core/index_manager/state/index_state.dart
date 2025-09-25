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
  return IndexState.aboutMe;
});
