import '../data/seed.dart';
import '../models/feed_item.dart';

class FeedRepository {
  final List<FeedItem> _items = List.of(seedFeed);

  List<FeedItem> get items => List.unmodifiable(_items);

  void toggleLike(String id) {
    final i = _items.indexWhere((e) => e.id == id);
    if (i < 0) return;
    final it = _items[i];
    it.liked = !it.liked;
    it.likes += it.liked ? 1 : -1;
  }
}

