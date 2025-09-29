import 'package:rw_portfolio/core/design_system/_index.dart';

Widget positiveButton({
  required String text,
  required VoidCallback onPressed,
  Color color = Colors.blue,
  double opacity = 0.7,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color.withOpacity(opacity), // ✅ 색상 투명도만 조절
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}

Widget negativeButton({
  required String text,
  required VoidCallback onPressed,
  Color color = Colors.grey,
  double opacity = 0.7,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color.withOpacity(opacity), // ✅ 색상 투명도만 조절
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}

Widget determinePositiveButton(
  bool isSelected, {
  required String text,
  required VoidCallback onPressed,
}) {
  if (isSelected) {
    return positiveButton(text: text, onPressed: onPressed);
  }
  return negativeButton(text: text, onPressed: onPressed);
}
