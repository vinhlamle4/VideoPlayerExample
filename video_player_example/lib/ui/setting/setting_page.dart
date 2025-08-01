import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/Utils/layout_size.dart';
import 'package:video_player_example/ui/setting/setting_view_model.dart';
import 'package:video_player_example/utils/app_theme.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final viewModel = ref.watch(settingViewModelProvider);

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getSystemThemeMode(MediaQuery.of(context).platformBrightness);
    });

    return WillPopScope(
      onWillPop: () async {
        viewModel.updateCheckSystemTheme();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Settings'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              viewModel.updateCheckSystemTheme();
              Navigator.of(context).pop();
            },
          ),
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
                    Divider(color: theme.appColors.divider, height: 0),
                itemCount: 1)),
      ),
    );
  }
}
