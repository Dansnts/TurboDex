class Vehicle {
  final String id;
  final String make;
  final String model;
  final int year;
  final String type; // e.g. "Electric Vehicle"
  final String color;
  final String imageUrl;

  const Vehicle({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.type,
    required this.color,
    required this.imageUrl,
  });

  String get displayName => '$make $model ($year)';
}

