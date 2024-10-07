import 'package:flutter/material.dart';
import 'package:netflix_flutter/models/show_data.dart' as showData;
import 'package:netflix_flutter/utils/navigation_utils.dart';
// import 'package:flutter_html/flutter_html.dart';

class DetailsScreen extends StatelessWidget {
  final showData.ShowModel? showDetails;
  const DetailsScreen({super.key, this.showDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                showDetails?.show.image?.original ??
                    "https://i0.wp.com/vfxdownload.com/wp-content/uploads/2017/05/87878977878888KKplo.JPG878787NNoiu.jpg?fit=938%2C526&ssl=1",
                fit: BoxFit.cover,
              ),
            ),
            // leading: IconButton(
            //   icon: const Icon(Icons.arrow_back),
            //   onPressed: () {
            //     navigateBack(context);
            //   },
            // ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        showDetails?.show.name ?? 'Title',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.yellow, size: 20),
                          Text(
                            showDetails?.show.rating.average.toString() ??
                                'Nil',
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Year, Episodes, Resolution Icons
                  Row(
                    children: [
                      Text(showDetails?.show.premiered ?? 'Date not available'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.hd,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // series description
                  SelectableText(
                    showDetails?.show.summary ?? 'Insert Description',
                    style: const TextStyle(fontSize: 16),
                  ),
                  // Html(
                  //   data: showDetails?.show.summary ?? 'Insert Description',
                  //   style: {
                  //     "p": Style(
                  //       fontSize: const FontSize(16),
                  //     ),
                  //     "b": Style(
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   },
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Buttons (Play and Download)
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Play'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Tab Bar(Episodes, collection, more like this, etc.)
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(
                              text: 'Episodes',
                            ),
                            Tab(
                              text: 'Collection',
                            ),
                            Tab(
                              text: 'More Like This',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 400, // Set appropriate height for TabBarView
                          child: TabBarView(
                            children: [
                              // Episodes tab Content
                              ListView.builder(
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/en/thumb/e/e7/Video-x-generic.svg/1024px-Video-x-generic.svg.png'),
                                    title: Text('Episode ${index + 1}'),
                                    subtitle: const Text('1 Hr 4 min'),
                                  );
                                },
                              ),
                              // Collection Tab Content
                              const Center(
                                child: Text('Collection Tab Content'),
                              ),
                              // More like this tab content
                              const Center(
                                child: Text('More Like This Tab content'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
