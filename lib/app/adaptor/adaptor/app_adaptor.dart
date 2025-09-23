import '../_index.dart';

// 앱 공통 Wrapper 어댑터
// Wrapper를 정의하고 AppRoot에서처럼 사용
class WrapperAdapter extends StatelessWidget {
  final List<Widget Function(Widget child)> wrappers;
  final Widget child;

  const WrapperAdapter({
    super.key,
    required this.wrappers,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // wrappers를 순서대로 fold 해서 child를 감싼다
    Widget wrapped = child;
    for (final wrapper in wrappers.reversed) {
      wrapped = wrapper(wrapped);
    }
    return wrapped;
  }
}
