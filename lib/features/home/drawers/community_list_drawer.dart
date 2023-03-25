import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../community/views/create_community_page.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.add_rounded),
            title: const Text('Create a Community'),
            onTap: () =>
                Routemaster.of(context).push(CreateCommunityPage.routeName),
          )
        ],
      ),
    );
  }
}
