import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/profile_controller.dart';
import '../../repositories/user_repository.dart';
import '../../repositories/vehicle_repository.dart';
import '../widgets/async_net_image.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<ProfileController>();
    final user = context.watch<UserRepository>();

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: user.avatarUrl != null ? NetworkImage(user.avatarUrl!) : null,
                child: user.avatarUrl == null ? const Icon(Icons.person) : null,
              ),
              const SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('@${user.username}', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 6),
                SizedBox(
                  width: 180,
                  child: LinearProgressIndicator(value: ctrl.xpProgress),
                ),
                Text('Lvl ${ctrl.level} • ${ctrl.xp}/100 XP'),
              ]),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: () {
                  // Ici tu peux appeler une action de changement d’avatar (image_picker)
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Change avatar (à brancher)')));
                },
                icon: const Icon(Icons.edit),
                label: const Text('Avatar'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Showcase
          Text('Showcase', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _ShowcaseRow(),

          const SizedBox(height: 16),
          // Achievements (exemples)
          Text('Achievements', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _AchievementLine(title: 'Spot 5 common cars', xp: 5),
          _AchievementLine(title: 'Spot 1 legendary', xp: 25),

          const SizedBox(height: 16),
          // Liked posts
          Text('Liked posts', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _LikedPostsGrid(),
        ],
      ),
    );
  }
}

class _ShowcaseRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sc = context.watch<VehicleRepository>().showcase;
    if (sc.isEmpty) {
      return const Text('Aucune voiture en vitrine pour le moment');
    }
    return Row(
      children: List.generate(3, (i) {
        final v = i < sc.length ? sc[i] : null;
        return Expanded(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Padding(
              padding: EdgeInsets.only(right: i == 2 ? 0 : 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: v == null
                    ? Container(color: Colors.black12, child: const Center(child: Text('—')))
                    : AsyncNetImage(networkUrl: v.imageUrl),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _AchievementLine extends StatelessWidget {
  final String title;
  final int xp;
  const _AchievementLine({required this.title, required this.xp});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.emoji_events_outlined),
      title: Text(title),
      trailing: Text('+${xp}xp'),
      dense: true,
    );
  }
}

class _LikedPostsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final liked = context.watch<ProfileController>().likedPosts;
    if (liked.isEmpty) return const Text('Aucun like pour le moment');
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: liked.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 4,
      ),
      itemBuilder: (_, i) {
        final p = liked[i];
        return ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(p.photoUrl ?? p.vehicle.imageUrl, fit: BoxFit.cover),
        );
      },
    );
  }
}
