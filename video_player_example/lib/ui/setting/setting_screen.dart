import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/Utils/layout_size.dart';
import 'package:video_player_example/ui/setting/setting_view_model.dart';
import 'package:video_player_example/utils/app_theme.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final viewModel = ref.watch(settingViewModelProvider);

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getSystemThemeMode(MediaQuery.of(context).platformBrightness);
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: SafeArea(
          child: ListView.separated(
              padding: const EdgeInsets.only(top: LayoutSize.sizePadding16),
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  title: const Text('Dark mode'),
                  trailing: Switch(
                    value: theme.mode == ThemeMode.dark,
                    onChanged: (bool value) {
                      if (theme.mode == ThemeMode.dark) {
                        viewModel.changeToLightTheme();
                      } else {
                        viewModel.changeToDarkTheme();
                      }
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(color: theme.appColors.primary, height: 0),
              itemCount: 1)),
    );
  }
}
