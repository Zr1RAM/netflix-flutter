import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String imageURL;
  final String title;
  const SearchItem({super.key, required this.imageURL, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          color: const Color.fromARGB(255, 65, 65, 65),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image part
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // title and button part
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_circle_outline,
                            size: 32,
                            color: Colors.grey,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
