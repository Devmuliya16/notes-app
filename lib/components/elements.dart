import 'package:flutter/material.dart';

class getBadge extends StatelessWidget {
  const getBadge({super.key, required this.priority});
  final int? priority;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      width: 12,
      child: DecoratedBox(
        decoration: BoxDecoration(color: _getPriority(priority ?? 0)),
      ),
    );
  }

  _getPriority(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.yellow;
      default:
        return Colors.transparent;
    }
  }
}
