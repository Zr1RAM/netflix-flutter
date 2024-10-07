import 'package:flutter/material.dart';
import 'package:netflix_flutter/models/show_data.dart';
import 'package:netflix_flutter/utils/shows_util.dart';
import 'package:netflix_flutter/utils/utils.dart';
import 'package:netflix_flutter/widgets/HomeScreenWidgets/category_row.dart';

class NetflixCategories extends StatelessWidget {
  final List<ShowModel>? showsData;
  const NetflixCategories({super.key, this.showsData});

  @override
  Widget build(BuildContext context) {
    // print('response length ${shows?.length}');
    Map<String, List<ShowModel>> showsClassified =
        classifyShowsByGenre(showsData ?? []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryRow(
            title: 'Popular on Netflix',
            movies: getRandomElements(showsData ?? [], 5)),
        CategoryRow(
            title: 'Trending Now',
            movies: getRandomElements(showsData ?? [], 7)),
        ...showsClassified.entries.map((entry) {
          String genre = entry.key;
          List<ShowModel> movies = entry.value;
          return CategoryRow(title: genre, movies: movies);
        })
        // CategoryRow(title: 'Action', movies: [
        //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKsRtu17L6tezgzr31vwG-9xurokavOGBX7A&s',
        //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxfb0qgpevSmw6joMtc3s1TZBUFuRSR0NV4w&s',
        //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPdgzuSTrK1m5X7oxaeOXjUrDepkNapvP5LQ&s',
        //   'https://images.fastcompany.com/image/upload/f_webp,c_fit,w_1920,q_auto/fc/3059450-poster-1280-netflix-and-imagery.jpg',
        //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO-b_M86nIG9sidNjHlgdzI0qSueD4FurbfQ&s'
        // ]),
        // CategoryRow(title: 'Comedy', movies: [
        //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKsRtu17L6tezgzr31vwG-9xurokavOGBX7A&s',
        //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxfb0qgpevSmw6joMtc3s1TZBUFuRSR0NV4w&s',
        //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPdgzuSTrK1m5X7oxaeOXjUrDepkNapvP5LQ&s',
        //   'https://images.fastcompany.com/image/upload/f_webp,c_fit,w_1920,q_auto/fc/3059450-poster-1280-netflix-and-imagery.jpg',
        //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO-b_M86nIG9sidNjHlgdzI0qSueD4FurbfQ&s'
        // ]),
      ],
    );
  }
}
