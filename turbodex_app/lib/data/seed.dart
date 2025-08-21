import '../models/vehicle.dart';
import '../models/feed_item.dart';
import '../models/comment.dart';
import '../models/user.dart';

// ===== Vehicles =====
// lib/data/seed.dart
import '../models/vehicle.dart';

// --- Jeu de données minimal pour compiler/démo ---
final List<Vehicle> allVehicles = [
  Vehicle(
    id: 'tesla_model_s_2023',
    make: 'Tesla',
    model: 'Model S',
    year: 2023,
    bodywork: 'Electric Vehicle',
    paint: 'Pearl White',
    rarity: VehicleRarity.rare,
    iconUrl: 'https://images.unsplash.com/photo-1549921296-3ae734d6b8a1',
    imageUrl: 'https://images.unsplash.com/photo-1549921296-3ae734d6b8a1',
  ),
  Vehicle(
    id: 'ford_mustang_gt_2022',
    make: 'Ford',
    model: 'Mustang GT',
    year: 2022,
    bodywork: 'Sports Car',
    paint: 'Racing Red',
    rarity: VehicleRarity.common,
    iconUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
    imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
  ),
  Vehicle(
    id: 'porsche_911_992',
    make: 'Porsche',
    model: '911 (992)',
    year: 2021,
    bodywork: 'Sports Car',
    paint: 'Gentian Blue',
    rarity: VehicleRarity.epic,
    iconUrl: 'https://images.unsplash.com/photo-1549923746-c502d488b3ea',
    imageUrl: 'https://images.unsplash.com/photo-1549923746-c502d488b3ea',
  ),
];

// ===== Users =====
final userMe = User(
  id: 'me',
  username: 'You',
  avatarUrl: 'https://i.pravatar.cc/150?img=3',
  friends: {'u1', 'u2'},
  foundVehicleIds: {}, // vide au départ
);

final userAlex = User(
  id: 'u1',
  username: 'Alex Chen',
  avatarUrl: 'https://i.pravatar.cc/150?img=5',
);
final userSarah = User(
  id: 'u2',
  username: 'Sarah Kim',
  avatarUrl: 'https://i.pravatar.cc/150?img=7',
);
final userMarc = User(
  id: 'u3',
  username: 'Marc Dupont',
  avatarUrl: 'https://i.pravatar.cc/150?img=9',
);

final users = {for (var u in [userMe, userAlex, userSarah, userMarc]) u.id: u};

// ===== Feed =====
final seedFeed = <FeedItem>[
  FeedItem(
    id: 'f1',
    userId: userAlex.id,
    userName: userAlex.username,
    userAvatarUrl: userAlex.avatarUrl,
    vehicle: allVehicles[0],
    capturedAt: DateTime.parse('2024-01-15T10:30:00Z'),
    city: 'San Francisco',
    country: 'USA',
    notes: 'Beautiful white Tesla with autopilot features',
    likes: 12,
    comments: [
      Comment(id: 'c1', userName: 'Maya', text: 'Clean 👌', createdAt:  DateTime.parse('2024-01-15T11:00:00Z')),
    ],
  ),
  FeedItem(
    id: 'f2',
    userId: userSarah.id,
    userName: userSarah.username,
    userAvatarUrl: userSarah.avatarUrl,
    vehicle: allVehicles[1],
    capturedAt: DateTime.parse('2024-02-04T09:12:00Z'),
    city: 'Lakeside',
    country: 'USA',
    notes: 'Classic American muscle car!',
    likes: 47,
  ),
  FeedItem(
    id: 'f3',
    userId: userMarc.id,
    userName: userMarc.username,
    userAvatarUrl: userMarc.avatarUrl,
    vehicle: allVehicles[2],
    capturedAt: DateTime.parse('2024-03-23T18:45:00Z'),
    city: 'Lyon',
    country: 'France',
    notes: 'Turbo S spotted near the river',
    likes: 91,
  ),
];


