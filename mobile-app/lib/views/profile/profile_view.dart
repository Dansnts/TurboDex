import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final p = context.watch<ProfileController>().me;
    final t = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(children: [
            CircleAvatar(radius: 36, backgroundImage: NetworkImage(p.avatarUrl)),
            const SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p.name, style: t.titleLarge),
              const SizedBox(height: 4),
              Text('${p.totalSpots} spots • ${p.uniqueModels} modèles • ${p.followers} followers'),
            ]),
          ]),
          const SizedBox(height: 24),
          const ListTile(leading: Icon(Icons.settings), title: Text('Paramètres')),
          const ListTile(leading: Icon(Icons.privacy_tip_outlined), title: Text('Confidentialité')),
          const ListTile(leading: Icon(Icons.info_outline), title: Text('À propos')),
        ],
      ),
    );
  }
}

