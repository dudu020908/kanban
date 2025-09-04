import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

class DoneProgressIndicator extends StatelessWidget {
  const DoneProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KanbanProvider>(
      builder: (_, Provider, children) {
        final value = Provider.value;

        final valueString = value == 0 ? '없음' : value.toString() + '/0 완료';
        return Row(
          children: [
            Icon(LucideIcons.circle),
            Text(valueString, style: TextStyle(fontSize: 20)),
          ],
        );
      },
    );
  }
}
