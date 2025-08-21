class UserRepository {
  String username = 'test';
  String? avatarUrl;

  // posts likés
  final Set<String> _likedPostIds = <String>{};
  // amis (par nom d’utilisateur)
  final Set<String> _friends = <String>{'Alex Chen', 'Sarah Kim'};

  bool isFriend(String name) => _friends.contains(name);

  void toggleLike(String postId) {
    if (_likedPostIds.contains(postId)) {
      _likedPostIds.remove(postId);
    } else {
      _likedPostIds.add(postId);
    }
  }

  List<String> likedPostIds() => _likedPostIds.toList();

  // achievements / xp (exemple)
  int levelXp = 0;
  int level = 1;

  void addXp(int xp) {
    levelXp += xp;
    while (levelXp >= 100) {
      levelXp -= 100;
      level++;
    }
  }
}
