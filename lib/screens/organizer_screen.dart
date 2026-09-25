import 'package:flutter/material.dart';


class OrganizerScreen extends StatefulWidget {
  const OrganizerScreen({super.key});

  @override
  State<OrganizerScreen> createState() => _OrganizerScreenState();
}

enum _Tab { about, events, reviews }

class _OrganizerScreenState extends State<OrganizerScreen> {
  _Tab _selectedTab = _Tab.about;

  static const Color primaryIndigo = Color(0xFF5B5FEF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: primaryIndigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Organizer',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: primaryIndigo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: Icon(Icons.more_vert, color: primaryIndigo),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 8),

            const Center(
              child: CircleAvatar(
                radius: 56,
                backgroundColor: Color(0xFFE6E6F5),
                child: Icon(Icons.person, size: 56, color: Colors.black38),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Albert Flores',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatItem(value: '2.368', label: 'Followers'),
                _VerticalDivider(),
                _StatItem(value: '346', label: 'Following'),
                _VerticalDivider(),
                _StatItem(value: '13', label: 'Events'),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryIndigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28)),
                    ),
                    icon: const Icon(Icons.person_add_alt, size: 18),
                    label: const Text('Follow'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryIndigo,
                      side: BorderSide(color: primaryIndigo),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28)),
                    ),
                    icon: const Icon(Icons.chat_bubble_outline, size: 18),
                    label: const Text('Messages'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

        
            Row(
              children: [
                _TabButton(
                  label: 'About',
                  selected: _selectedTab == _Tab.about,
                  color: primaryIndigo,
                  onTap: () => setState(() => _selectedTab = _Tab.about),
                ),
                const SizedBox(width: 10),
                _TabButton(
                  label: 'Events',
                  selected: _selectedTab == _Tab.events,
                  color: primaryIndigo,
                  onTap: () => setState(() => _selectedTab = _Tab.events),
                ),
                const SizedBox(width: 10),
                _TabButton(
                  label: 'Reviews',
                  selected: _selectedTab == _Tab.reviews,
                  color: primaryIndigo,
                  onTap: () => setState(() => _selectedTab = _Tab.reviews),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Содержимое меняется в зависимости от выбранной вкладки
            Align(
              alignment: Alignment.centerLeft,
              child: _buildTabContent(),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }


  Widget _buildTabContent() {
    switch (_selectedTab) {
      case _Tab.about:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
              'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi '
              'ut aliquip ex ea commodo consequat.',
              style: TextStyle(color: Colors.black54, height: 1.4),
            ),
            const SizedBox(height: 6),
            Text('Read more...', style: TextStyle(color: primaryIndigo)),
          ],
        );
      case _Tab.events:
        return const Text('Пока нет предстоящих событий.',
            style: TextStyle(color: Colors.black54));
      case _Tab.reviews:
        return const Text('Отзывов пока нет.', style: TextStyle(color: Colors.black54));
    }
  }
}

// Элемент статистики (число + подпись)
class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();
  @override
  Widget build(BuildContext context) {
    return Container(height: 36, width: 1, color: Colors.grey.shade300);
  }
}

// Кнопка-вкладка (About / Events / Reviews)
class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? color : Colors.white,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
