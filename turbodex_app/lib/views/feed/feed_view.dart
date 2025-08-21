// lib/views/feed/feed_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/feed_controller.dart';
import '../../models/feed_item.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});
  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<FeedController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Feed'),
        bottom: TabBar(
          controller: _tabs,
          tabs: const [
            Tab(text: 'Friends'),
            Tab(text: 'Worldwide'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [
          _FeedList(items: ctrl.friends),
          _FeedList(items: ctrl.worldwide),
        ],
      ),
    );
  }
}

class _FeedList extends StatelessWidget {
  final List<FeedItem> items;
  const _FeedList({required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('No posts yet'));
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      itemBuilder: (_, i) => _FeedCard(item: items[i]),
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemCount: items.length,
    );
  }
}

class _FeedCard extends StatelessWidget {
  final FeedItem item;
  const _FeedCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<FeedController>();
    final cs = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // header
          ListTile(
            leading: CircleAvatar(backgroundImage: item.userAvatarUrl != null ? NetworkImage(item.userAvatarUrl!) : null),
            title: Text(item.userName),
            subtitle: Text('${ctrl.timeAgo(item.createdAt)}  •  ${item.locationName}'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: cs.secondaryContainer,
              ),
              child: Text(item.vehicle.type ?? 'Vehicle',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: cs.onSecondaryContainer)),
            ),
          ),
          // photo
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(item.photoUrl, fit: BoxFit.cover),
          ),
          // title
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(item.vehicle.displayName, style: Theme.of(context).textTheme.titleMedium),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(item.vehicle.color ?? '-', style: Theme.of(context).textTheme.bodySmall),
          ),
          // actions
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              children: [
                IconButton(
                  tooltip: item.isLiked ? 'Unlike' : 'Like',
                  onPressed: () => ctrl.toggleLike(item.id),
                  icon: Icon(item.isLiked ? Icons.favorite : Icons.favorite_border),
                ),
                Text('${item.likes}'),
                const SizedBox(width: 12),
                IconButton(
                  tooltip: 'Share',
                  onPressed: () => ctrl.share(item),
                  icon: const Icon(Icons.ios_share),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {}, // menu 3 points si tu veux garder
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
