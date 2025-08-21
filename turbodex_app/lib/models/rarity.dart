// lib/models/rarity.dart
enum VehicleRarity { common, rare, epic, legendary }

extension VehicleRarityX on VehicleRarity {
  String get label {
    switch (this) {
      case VehicleRarity.common:
        return 'Common';
      case VehicleRarity.rare:
        return 'Rare';
      case VehicleRarity.epic:
        return 'Epic';
      case VehicleRarity.legendary:
        return 'Legendary';
    }
  }
}
