// lib/models/feed_item.dart
import 'package:flutter/foundation.dart';
import 'vehicle.dart';

@immutable
class FeedItem {
  final String id;
  final String userName;
  final String? userAvatarUrl;
  final DateTime createdAt;

  final Vehicle vehicle;

  /// Ex: "Paris, France"
  final String locationName;

  /// URL de la photo du post
  final String photoUrl;

  /// Post publié par un ami ?
  final bool isFriendPost;

  /// L'utilisateur courant a liké ?
  final bool isLiked;

  final int likes;
  final int comments;

  const FeedItem({
    required this.id,
    required this.userName,
    required this.userAvatarUrl,
    required this.createdAt,
    required this.vehicle,
    required this.locationName,
    required this.photoUrl,
    required this.isFriendPost,
    required this.isLiked,
    required this.likes,
    required this.comments,
  });

  FeedItem copyWith({
    String? id,
    String? userName,
    String? userAvatarUrl,
    DateTime? createdAt,
    Vehicle? vehicle,
    String? locationName,
    String? photoUrl,
    bool? isFriendPost,
    bool? isLiked,
    int? likes,
    int? comments,
  }) {
    return FeedItem(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userAvatarUrl: userAvatarUrl ?? this.userAvatarUrl,
      createdAt: createdAt ?? this.createdAt,
      vehicle: vehicle ?? this.vehicle,
      locationName: locationName ?? this.locationName,
      photoUrl: photoUrl ?? this.photoUrl,
      isFriendPost: isFriendPost ?? this.isFriendPost,
      isLiked: isLiked ?? this.isLiked,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
    );
  }
}
