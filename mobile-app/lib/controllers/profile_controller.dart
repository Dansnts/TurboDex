import 'package:flutter/foundation.dart';
import '../models/user.dart';

class ProfileController extends ChangeNotifier {
  UserProfile me = const UserProfile(
    id: 'u1',
    name: 'John Doe',
    avatarUrl:
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?q=80&w=300&auto=format&fit=crop',
    totalSpots: 23,
    uniqueModels: 12,
    followers: 58,
  );
}

