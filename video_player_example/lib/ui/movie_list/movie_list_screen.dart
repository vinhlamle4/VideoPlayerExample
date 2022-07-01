import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/Utils/font_size.dart';
import 'package:video_player_example/Utils/layout_size.dart';
import 'package:video_player_example/data/model/movie.dart';
import 'package:video_player_example/extension/padding.dart';
import 'package:video_player_example/ui/movie_list/movie_list_view_model.dart';
import 'package:video_player_example/ui/movie_player/movie_player_screen.dart';
import 'package:video_player_example/utils/app_theme.dart';

class MovieListScreen extends HookConsumerWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;
    final viewModel = ref.watch(movieListProvider);

    useMemoized(() {
      viewModel.fetchMovie();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: viewModel.asyncMovie.when(
          data: (movies) {
            return _buildBody(movies, context);
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(appColors.secondary),
              ),
            );
          },
          error: (_, __) {
            return const Center(
              child: Text('Fetch API Error'),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(List<Movie> movies, BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: LayoutSize.sizePadding24),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Stack(children: [
          Card(

            borderOnForeground: true,
            semanticContainer: true,
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(LayoutSize.sizePadding16)
            ),
            child: Column(
              children: [
                _buildImage(movies[index].thumb, movies[index].title, context),
              ],
            ).paddingAll(LayoutSize.sizePadding16),
          ).paddingAll(LayoutSize.sizePadding16),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MoviePlayerScreen(movie: movies[index])),
                  );
                },
              ),
            ).paddingAll(LayoutSize.sizePadding16),
          )
        ]);
      },
    );
  }

  Widget _buildImage(String src, String movieName, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = (width * 9) / 16;
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(LayoutSize.borderRadius8),
            image:
                DecorationImage(image: NetworkImage(src), fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(movieName,
              style: const TextStyle(
                  fontSize: FontSize.pt20, color: Colors.white)),
        ),
      ),
    );
  }
}
