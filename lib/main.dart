import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:kanban/ui/kanban_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => KanbanProvider())],
      child: ShadApp(
        theme: ShadThemeData(
          brightness: Brightness.light,
          colorScheme: ShadSlateColorScheme.light(),
        ),
        home: KanbanScreen(),
      ),
    );
  }
}
