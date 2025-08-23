import 'package:flutter/foundation.dart';
import '../models/feed_item.dart';
import '../repositories/feed_repository.dart';

class FeedController extends ChangeNotifier {
  final FeedRepository repo;
  FeedController(this.repo);

  List<FeedItem> get items => repo.items;

  void toggleLike(String id) {
    repo.toggleLike(id);
    notifyListeners();
  }
}

