import 'vehicle.dart';

class FeedItem {
  final String id;
  final String userName;
  final String userAvatarUrl;
  final Vehicle vehicle;
  final DateTime capturedAt;
  final String location;
  final String notes;
  int likes;
  int comments;
  bool liked;

  FeedItem({
    required this.id,
    required this.userName,
    required this.userAvatarUrl,
    required this.vehicle,
    required this.capturedAt,
    required this.location,
    required this.notes,
    this.likes = 0,
    this.comments = 0,
    this.liked = false,
  });
}

