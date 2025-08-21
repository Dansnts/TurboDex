class User {
  String id;
  String username;
  String avatarUrl;

  // Social
  final Set<String> friends;     // ids
  final Set<String> likedPosts;  // ids de FeedItem
  final Set<String> showcaseVehicleIds;

  // Progression
  int xp;
  final Set<String> foundVehicleIds; // pokédex “trouvées”

  User({
    required this.id,
    required this.username,
    required this.avatarUrl,
    Set<String>? friends,
    Set<String>? likedPosts,
    Set<String>? showcaseVehicleIds,
    this.xp = 0,
    Set<String>? foundVehicleIds,
  })  : friends = friends ?? {},
        likedPosts = likedPosts ?? {},
        showcaseVehicleIds = showcaseVehicleIds ?? {},
        foundVehicleIds = foundVehicleIds ?? {};

  int get level => 1 + xp ~/ 100;
}
