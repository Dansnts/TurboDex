import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'controllers/camera_controller.dart';
import 'controllers/collection_controller.dart';
import 'controllers/feed_controller.dart';
import 'controllers/profile_controller.dart';
import 'repositories/feed_repository.dart';
import 'repositories/vehicle_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // DI simple via Provider
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => VehicleRepository()),
      Provider(create: (_) => FeedRepository()),
      ChangeNotifierProvider(create: (ctx) =>
          FeedController(ctx.read<FeedRepository>())),
      ChangeNotifierProvider(create: (ctx) =>
          CollectionController(ctx.read<VehicleRepository>())),
      ChangeNotifierProvider(create: (_) => CameraController()),
      ChangeNotifierProvider(create: (_) => ProfileController()),
    ],
    child: const TurboDexApp(),
  ));
}

