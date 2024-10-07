import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_flutter/models/show_data.dart' as showData;
import 'package:netflix_flutter/utils/navigation_utils.dart';
import 'package:netflix_flutter/views/details_screen.dart';

// class CategoryRow extends StatelessWidget {
//   final String title;
//   final List<String> movies;
//   const CategoryRow({super.key, required this.title, required this.movies});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const Text(
//                 "See all",
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           height: 150,
//           child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: movies.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.network(movies[index], fit: BoxFit.fitHeight),
//                 );
//               }),
//         )
//       ],
//     );
//   }
// }

class CategoryRow extends StatefulWidget {
  final String title;
  final List<showData.ShowModel> movies;
  const CategoryRow({super.key, required this.title, required this.movies});

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  // final ScrollController _scrollController = ScrollController();

  // void _scrolltoIndex(int index) {
  //   double position = index * 100.0;
  //   _scrollController.animateTo(position,
  //       duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   int index = 0;
  //   Timer.periodic(const Duration(seconds: 1), (Timer timer) {
  //     if (index < 5) {
  //       _scrolltoIndex(index++);
  //     } else {
  //       index = 0;
  //       _scrolltoIndex(index);
  //     }
  //     print('index: $index');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "See all",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
              // controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        navigateToScreen(
                            context,
                            DetailsScreen(
                              showDetails: widget.movies[index],
                            ));
                      },
                      child: Image.network(
                          widget.movies[index].show.image?.medium ??
                              "https://upload.wikimedia.org/wikipedia/en/thumb/e/e7/Video-x-generic.svg/1024px-Video-x-generic.svg.png",
                          fit: BoxFit.fitHeight),
                    ));
              }),
        )
      ],
    );
    ;
  }
}
