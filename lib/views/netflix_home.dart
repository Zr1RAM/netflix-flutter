import 'package:flutter/material.dart';
import 'package:netflix_flutter/views/seach_screen.dart';
import 'package:netflix_flutter/widgets/bottom_navigation_bar.dart';
import 'package:netflix_flutter/widgets/HomeScreenWidgets/netflix_body.dart';

// class NetflixHome extends StatelessWidget {
//   const NetflixHome({super.key});
//   final String titleURL =
//       'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2014_logo.svg/300px-Netflix_2014_logo.svg.png';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         leading: const Icon(Icons.menu),
//         // title: const Text('NETFLIX'),
//         // centerTitle: true,
//         // title: Container(
//         //   alignment: Alignment.center,
//         //   child: const Text('NETFLIX'),
//         // ),
//         title: Image.network(
//           titleURL,
//           height: 40,
//           fit: BoxFit.contain,
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline))
//         ],
//       ),
//       body: const NetflixBody(),
//       bottomNavigationBar: const NetflixBottomNav(),
//     );
//   }
// }

class NetflixHome extends StatefulWidget {
  const NetflixHome({super.key});

  @override
  State<NetflixHome> createState() => _NetflixHomeState();
}

class _NetflixHomeState extends State<NetflixHome> {
  final String titleURL =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2014_logo.svg/300px-Netflix_2014_logo.svg.png';

  int _selectedIndex = 0;

  void _onItemtapped(int index) {
    switch (index) {
      case 1:
        navigateToSearchScreen();
        break;
      default:
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToSearchScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SearchScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.menu),
        // title: const Text('NETFLIX'),
        // centerTitle: true,
        // title: Container(
        //   alignment: Alignment.center,
        //   child: const Text('NETFLIX'),
        // ),
        title: Image.network(
          titleURL,
          height: 40,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline))
        ],
      ),
      body: const NetflixBody(),
      bottomNavigationBar: NetflixBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemtapped,
      ),
    );
    ;
  }
}
