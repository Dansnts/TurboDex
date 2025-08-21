// lib/models/vehicle.dart
import 'rarity.dart';

enum VehicleRarity { common, rare, epic, legendary }

class Vehicle {
  final String id;
  final String make;
  final String model;
  final int year;
  final String imageUrl;     // grande image
  final String iconUrl;      // icône/petite image si tu as
  final VehicleRarity rarity;
  final String bodywork;     // "SUV", "Coupe", etc.
  final String? color;       // peut être null
  final String? type;        // ex: "Electric Vehicle"

  Vehicle({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.imageUrl,
    required this.iconUrl,
    required this.rarity,
    required this.bodywork,
    this.color,
    this.type,
  });

  String get displayName => '$year $make $model';

  /// Fallback pour les widgets qui utilisaient thumbnail
  String get thumbnailUrl => imageUrl;
}