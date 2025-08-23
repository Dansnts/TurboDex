import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/feed_controller.dart';
import '../../models/feed_item.dart';
import '../widgets/async_net_image.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<FeedController>();
    final items = ctrl.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Découvertes')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) => _FeedCard(item: items[i], onLike: () => ctrl.toggleLike(items[i].id)),
      ),
    );
  }
}

class _FeedCard extends StatelessWidget {
  final FeedItem item;
  final VoidCallback onLike;

  const _FeedCard({required this.item, required this.onLike});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(item.userAvatarUrl)),
            title: Text(item.userName),
            subtitle: Text('${item.location} • ${item.capturedAt.toLocal()}'),
          ),
          AsyncNetImage(url: item.vehicle.imageUrl, height: 220, radius: BorderRadius.zero),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item.vehicle.displayName, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              Text(item.notes),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    onPressed: onLike,
                    icon: Icon(item.liked ? Icons.favorite : Icons.favorite_border, color: item.liked ? cs.error : null),
                  ),
                  Text('${item.likes}'),
                  const SizedBox(width: 16),
                  const Icon(Icons.mode_comment_outlined, size: 20),
                  const SizedBox(width: 4),
                  Text('${item.comments}'),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}

