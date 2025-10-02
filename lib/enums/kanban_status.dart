import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum KanbanStatus { todo, progress, done }

extension KanbanStatusExtension on KanbanStatus {
  String get label => switch (this) {
    KanbanStatus.todo => 'To-do',
    KanbanStatus.progress => 'Inprogress',
    KanbanStatus.done => 'Done',
  };

  Color get backgroundColor => switch (this) {
    KanbanStatus.todo => Color(0xFFF8F8F8),
    KanbanStatus.progress => Color(0xFFEBF7FC),
    KanbanStatus.done => Color(0xFFEDF9E8),
  };

  Color get bubbleColor => switch (this) {
    KanbanStatus.todo => Color(0xFFE8E8E8),
    KanbanStatus.progress => Color(0xFFC8E9FF),
    KanbanStatus.done => Color(0xFFCAF0B9),
  };

  IconData get icon => switch (this) {
    KanbanStatus.todo => LucideIcons.circlePause,
    KanbanStatus.progress => LucideIcons.circlePlay,
    KanbanStatus.done => LucideIcons.circleCheck,
  };
  IconData get nexticon => switch (this) {
    KanbanStatus.todo => LucideIcons.circlePlay,
    KanbanStatus.progress => LucideIcons.circlePause,
    KanbanStatus.done => LucideIcons.circleCheck,
  };
}

class KanbanUtil {
  static KanbanStatus stringToStatus(String value) {
    // KanbanStatus status;
    // if (value == 'progress') {
    //   status = KanbanStatus.progress;
    // } else if (value == 'done') {
    //   status = KanbanStatus.done;
    // } else {
    //   status = KanbanStatus.todo;
    // }
    // return status;

    //2번째 Switch-case
    // return switch (value) {
    //   'progress' => KanbanStatus.progress,
    //   'done' => KanbanStatus.done,
    //   _ => KanbanStatus.todo,
    // };
    return KanbanStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => KanbanStatus.todo,
    );
  }
}
