// lib/controllers/feed_controller.dart
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/feed_item.dart';
import '../repositories/feed_repository.dart';
import '../repositories/user_repository.dart';
import '../repositories/pokedex_repository.dart';

class FeedController extends ChangeNotifier {
  final FeedRepository feed;
  final UserRepository users;
  final PokedexRepository dex;

  FeedController(this.feed, this.users, this.dex);

  List<FeedItem> get friends => feed.itemsByScope(FeedScope.friends);
  List<FeedItem> get worldwide => feed.itemsByScope(FeedScope.worldwide);

  void toggleLike(String id) {
    feed.toggleLike(id);
    users.toggleLikePost(id); // implémente en no-op si besoin
    notifyListeners();
  }

  String timeAgo(DateTime dt, {String locale = 'fr'}) {
    timeago.setLocaleMessages('fr', timeago.FrMessages());
    return timeago.format(dt.toLocal(), locale: locale);
  }

  Future<void> share(FeedItem item) async {
    final link = feed.shareLinkFor(item);
    final msg = '${item.vehicle.displayName} • ${item.locationName}\n$link';
    await Share.share(msg);
  }
}
