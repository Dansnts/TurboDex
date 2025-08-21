import 'package:flutter/foundation.dart';
import '../repositories/feed_repository.dart';
import '../repositories/user_repository.dart';
import '../repositories/vehicle_repository.dart';

class ProfileController extends ChangeNotifier {
  final UserRepository users;
  final FeedRepository feed;
  final VehicleRepository vehicles;

  ProfileController(this.users, this.feed, this.vehicles);

  // Stats
  int get level => users.level;
  int get xp => users.levelXp; // sur 100 par niveau

  double get xpProgress => (users.levelXp.clamp(0, 100)) / 100.0;

  // Liked posts
  List<String> get likedIds => users.likedPostIds();
  // Mapping vers FeedItem
  List get likedPosts =>
      feed.items.where((p) => likedIds.contains(p.id)).toList();

  // Showcase
  List get showcase => vehicles.showcase;
}
