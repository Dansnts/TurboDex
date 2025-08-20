class UserProfile {
  final String id;
  final String name;
  final String avatarUrl;
  final int totalSpots;
  final int uniqueModels;
  final int followers;

  const UserProfile({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.totalSpots = 0,
    this.uniqueModels = 0,
    this.followers = 0,
  });
}

