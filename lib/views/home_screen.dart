import 'package:flutter/material.dart';
import 'package:netflix_flutter/views/netflix_home.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home screen'),
//       ),
//       body: const Center(
//         child: Text("Welcome to the home screen"),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      home: const NetflixHome(),
      theme: ThemeData.dark(), // Netflix uses a dark theme
    );
  }
}
