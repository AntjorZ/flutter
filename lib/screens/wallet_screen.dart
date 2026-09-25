import 'package:flutter/material.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  // Состояние: индекс выбранной вкладки внизу экрана
  int _selectedIndex = 3; 

  final List<_Transaction> _transactions = const [
    _Transaction('Lawson Chair', 'Dec 15, 2024 | 10:00 AM', '\$120', 'Orders', true),
    _Transaction('Top Up Wallet', 'Dec 14, 2024 | 16:42 PM', '\$400', 'Top Up', false),
    _Transaction('Parabolic Reflector', 'Dec 14, 2024 | 11:39 AM', '\$170', 'Orders', true),
    _Transaction('Mini Wooden Table', 'Dec 13, 2024 | 14:46 PM', '\$165', 'Orders', true),
    _Transaction('Top Up Wallet', 'Dec 12, 2024 | 09:27 AM', '\$300', 'Top Up', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Row(
          children: const [
            Icon(Icons.dehaze, color: Colors.black),
            SizedBox(width: 10),
            Text(
              'My E-Wallet',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),


            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.grey.shade900, Colors.black],
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Andrew Ainsley',
                          style: TextStyle(
                              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Row(
                        children: const [
                          Icon(Icons.credit_card, color: Colors.white70, size: 28),
                          SizedBox(width: 4),
                          Icon(Icons.circle, color: Colors.redAccent, size: 22),
                          Icon(Icons.circle, color: Colors.orangeAccent, size: 22),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('•••• •••• •••• 3629',
                      style: TextStyle(color: Colors.white70, fontSize: 16, letterSpacing: 2)),
                  const SizedBox(height: 24),
                  const Text('Your balance', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$9,379',
                          style: TextStyle(
                              color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                        ),
                        icon: const Icon(Icons.file_download_outlined, size: 18),
                        label: const Text('Top Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Заголовок истории операций
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Transaction History',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('See All', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),

            // Список транзакций
            ..._transactions.map((t) => _TransactionTile(transaction: t)),

            const SizedBox(height: 80),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}


class _Transaction {
  final String title;
  final String date;
  final String amount;
  final String tag; // "Orders" или "Top Up"
  final bool isOrder; // true = красная иконка "вверх", false = синяя "вниз"

  const _Transaction(this.title, this.date, this.amount, this.tag, this.isOrder);
}

// Один элемент списка транзакций
class _TransactionTile extends StatelessWidget {
  final _Transaction transaction;
  const _TransactionTile({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              transaction.tag == 'Top Up' ? Icons.account_balance_wallet : Icons.shopping_bag,
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(transaction.date,
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(transaction.amount,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(transaction.tag, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: transaction.isOrder ? Colors.red : Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      transaction.isOrder ? Icons.arrow_upward : Icons.arrow_downward,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
