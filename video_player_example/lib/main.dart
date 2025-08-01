import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/ui/movie_list/movie_list_screen.dart';
import 'package:video_player_example/utils/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    return MaterialApp(
      theme: theme.data,
      darkTheme: AppTheme.dark().data,
      themeMode: themeMode,
      home: const MovieListScreen(),
    );
  }
}
