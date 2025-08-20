import '../models/feed_item.dart';
import '../models/vehicle.dart';

final seedVehicles = <Vehicle>[
  const Vehicle(
    id: 'v1',
    make: 'Tesla',
    model: 'Model S',
    year: 2023,
    type: 'Electric Vehicle',
    color: 'Pearl White',
    imageUrl:
        'https://images.unsplash.com/photo-1617788138017-80ad40651399?q=80&w=1400&auto=format&fit=crop',
  ),
  const Vehicle(
    id: 'v2',
    make: 'Ford',
    model: 'Mustang GT',
    year: 2021,
    type: 'Coupe',
    color: 'Grabber Blue',
    imageUrl:
        'https://images.unsplash.com/photo-1541447271487-09620ecfee16?q=80&w=1400&auto=format&fit=crop',
  ),
  const Vehicle(
    id: 'v3',
    make: 'Porsche',
    model: '911 Turbo S',
    year: 2022,
    type: 'Sports',
    color: 'Guards Red',
    imageUrl:
        'https://images.unsplash.com/photo-1616789914760-23d4bf0c9cd3?q=80&w=1400&auto=format&fit=crop',
  ),
];

final seedFeed = <FeedItem>[
  FeedItem(
    id: 'f1',
    userName: 'Alex Chen',
    userAvatarUrl:
        'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?q=80&w=300&auto=format&fit=crop',
    vehicle: seedVehicles[0],
    capturedAt: DateTime.parse('2024-01-15T10:30:00Z'),
    location: 'Downtown',
    notes: 'Beautiful white Tesla with autopilot features',
    likes: 12,
    comments: 3,
  ),
  FeedItem(
    id: 'f2',
    userName: 'Sarah Kim',
    userAvatarUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=300&auto=format&fit=crop',
    vehicle: seedVehicles[1],
    capturedAt: DateTime.parse('2024-02-04T09:12:00Z'),
    location: 'Lakeside',
    notes: 'Classic growl, immaculate condition',
    likes: 47,
    comments: 11,
  ),
  FeedItem(
    id: 'f3',
    userName: 'Marc Dupont',
    userAvatarUrl:
        'https://images.unsplash.com/photo-1527980965255-d3b416303d12?q=80&w=300&auto=format&fit=crop',
    vehicle: seedVehicles[2],
    capturedAt: DateTime.parse('2024-03-23T18:45:00Z'),
    location: 'Old town',
    notes: 'Turbo S spotted near the river',
    likes: 91,
    comments: 22,
  ),
];

