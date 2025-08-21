// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Controllers
import 'controllers/feed_controller.dart';
import 'controllers/pokedex_controller.dart';
import 'controllers/profile_controller.dart';
import 'controllers/collection_controller.dart';

// Repositories
import 'repositories/feed_repository.dart';
import 'repositories/pokedex_repository.dart';
import 'repositories/user_repository.dart';
import 'repositories/vehicle_repository.dart';

// Root app
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Repositories singletons
  final feedRepo = FeedRepository();
  final userRepo = UserRepository();
  final vehicleRepo = VehicleRepository();
  final dexRepo = PokedexRepository(); // constructeur sans args

  runApp(
    MultiProvider(
      providers: [
        Provider<FeedRepository>.value(value: feedRepo),
        Provider<UserRepository>.value(value: userRepo),
        Provider<VehicleRepository>.value(value: vehicleRepo),
        Provider<PokedexRepository>.value(value: dexRepo),

        ChangeNotifierProvider(create: (_) => FeedController(feedRepo, userRepo, dexRepo)),
        ChangeNotifierProvider(create: (_) => PokedexController(dexRepo, userRepo)),
        ChangeNotifierProvider(create: (_) => ProfileController(userRepo, feedRepo, vehicleRepo)),
        ChangeNotifierProvider(create: (ctx) => CollectionController(dexRepo, userRepo)),
      ],
      child: const TurboDexApp(> users.levelXp; // sur 100 par niveau

  double get xpProgress => (users.levelXp.clamp(0, 100)) / 100.0;

  // Liked posts
  List<String> get likedIds => users.likedPostIds();
  // Mapping vers ),
    ),
  );
}
