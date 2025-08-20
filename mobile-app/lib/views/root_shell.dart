import 'package:flutter/material.dart';
import 'camera/camera_view.dart';
import 'collection/collection_view.dart';
import 'feed/feed_view.dart';
import 'pokedex/pokedex_view.dart';
import 'profile/profile_view.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int index = 1; // "Feed" par défaut

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      CameraView(),
      FeedView(),
      PokedexView(),
      CollectionView(),
      ProfileView(),
    ];


    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.photo_camera_outlined), selectedIcon: Icon(Icons.photo_camera), label: 'Scan'),
          NavigationDestination(icon: Icon(Icons.rss_feed_outlined), selectedIcon: Icon(Icons.rss_feed), label: 'Feed'),
          NavigationDestination(icon: Icon(Icons.directions_car_outlined), selectedIcon: Icon(Icons.directions_car), label: 'Pokédex'),
          NavigationDestination(icon: Icon(Icons.collections_bookmark_outlined), selectedIcon: Icon(Icons.collections_bookmark), label: 'Ma collection'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

