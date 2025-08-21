// lib/repositories/feed_repository.dart
import 'package:flutter/foundation.dart';
import '../models/feed_item.dart';

enum FeedScope { friends, worldwide }

class FeedRepository with ChangeNotifier {
  final List<FeedItem> _items = <FeedItem>[];

  List<FeedItem> get items => List.unmodifiable(_items);

  /// Optionnel : alimente depuis ton seed existant
  void replaceAll(Iterable<FeedItem> data) {
    _items
      ..clear()
      ..addAll(data);
    notifyListeners();
  }

  List<FeedItem> itemsByScope(FeedScope scope) {
    if (scope == FeedScope.friends) {
      return _items.where((e) => e.isFriendPost).toList(growable: false);
    }
    return _items;
  }

  void toggleLike(String id) {
    final idx = _items.indexWhere((e) => e.id == id);
    if (idx < 0) return;
    final it = _items[idx];
    final nextLiked = !it.isLiked;
    _items[idx] = it.copyWith(
      isLiked: nextLiked,
      likes: (it.likes + (nextLiked ? 1 : -1)).clamp(0, 1 << 31),
    );
    notifyListeners();
  }

  String shareLinkFor(FeedItem i) => 'https://turbodex.app/post/${i.id}';
}
