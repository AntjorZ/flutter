import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'podcast_screen.dart';
import 'wallet_screen.dart';
import 'organizer_screen.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_MenuItem>[
      _MenuItem('1. Login — medinow', (c) => const LoginScreen()),
      _MenuItem('2. Podcast — Secrets of Atlantis', (c) => const PodcastScreen()),
      _MenuItem('3. My E-Wallet', (c) => const WalletScreen()),
      _MenuItem('4. Organizer profile', (c) => const OrganizerScreen()),
    ];


    return Scaffold(
      appBar: AppBar(title: const Text('Мои макеты (Flutter)')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: item.builder),
              );
            },
            child: Text(item.title),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final WidgetBuilder builder;
  _MenuItem(this.title, this.builder);
}
