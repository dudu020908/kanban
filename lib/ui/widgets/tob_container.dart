import 'package:flutter/material.dart';
import 'package:kanban/ui/widgets/done_progress_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TobContainer extends StatelessWidget {
  const TobContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadAlert(
      crossAxisAlignment: CrossAxisAlignment.center,
      decoration: ShadDecoration(color: Color(0xFFFFADAD)),
      icon: Icon(LucideIcons.smile, size: 28),
      title: Row(
        children: [
          Expanded(child: Text('KanBan Board', style: TextStyle(fontSize: 24))),
          DoneProgressIndicator(),
        ],
      ),
    );
  }
}
