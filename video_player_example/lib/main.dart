import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/ui/movie_list/movie_list_screen.dart';
import 'package:video_player_example/ui/setting/setting_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);*/
    return MaterialApp(
      /*theme: theme.data,
      darkTheme: AppTheme.dark().data,
      themeMode: themeMode,*/
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedIndex = useState(0);

    final screens = <Widget>[const MovieListScreen(), const SettingScreen()];

    return Scaffold(
      body: screens[_selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex.value,
        onTap: (index) {
          _selectedIndex.value = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
