import 'package:flutter/material.dart';
import 'package:kingsman_mobileapp/features/waitingList/domain/models/waiting_list_item.dart';

class WaitingListPage extends StatefulWidget {
  const WaitingListPage({Key? key}) : super(key: key);

  @override
  State<WaitingListPage> createState() => _WaitingListPageState();
}

class _WaitingListPageState extends State<WaitingListPage> {
  final List<WaitingListItem> _waitingItems = [
    WaitingListItem(
      id: '1',
      name: 'Джинсы BOTTEGA 5667 200',
      price: 'от 7 900 ₽',
      image: 'assets/images/cardBg.png',
    ),
    WaitingListItem(
      id: '2',
      name: 'Рубашка классическая',
      price: 'от 5 500 ₽',
      image: 'assets/images/cardBg.png',
    ),
    WaitingListItem(
      id: '3',
      name: 'Костюм деловой',
      price: 'от 12 000 ₽',
      image: 'assets/images/cardBg.png',
    ),
  ];

  String? _selectedItemId;

  void _showContextMenu(String itemId) {
    setState(() {
      _selectedItemId = _selectedItemId == itemId ? null : itemId;
    });
  }

  void _shareItem(String itemId) {
    setState(() {
      _selectedItemId = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Поделиться товаром')),
    );
  }

  void _reserveItem(String itemId) {
    setState(() {
      _selectedItemId = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Артикул забронирован')),
    );
  }

  void _removeItem(String itemId) {
    setState(() {
      _waitingItems.removeWhere((item) => item.id == itemId);
      _selectedItemId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE9E2),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/mainBackground.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Column(
            children: [
              // Header
              Container(
                color: const Color(0xFF282A51),
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Row(
                  children: [
                    // Logo
                    Image.asset(
                      'assets/images/logo.png',
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12),
                    // Title and subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'MR.KINGSMAN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'ЛИСТ ОЖИДАНИЯ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.schedule,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Waiting List Items
              Expanded(
                child: _waitingItems.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.schedule_outlined,
                              size: 64,
                              color: Color(0xFF282A51),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Список ожидания пуст',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF282A51),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Добавьте товары в список ожидания',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _waitingItems.length,
                        itemBuilder: (context, index) {
                          final item = _waitingItems[index];
                          final isSelected = _selectedItemId == item.id;
                          
                          return Container(
                            margin: const EdgeInsets.only(bottom: 32),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Product Card
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF424242),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      // Product Image
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            item.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      // Product Info
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.price,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              item.name,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      // Out of Stock Button
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: const Text(
                                          'НЕТ В НАЛИЧИИ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Context Menu Button
                                Positioned(
                                  top: 8,
                                  right: 16,
                                  child: IconButton(
                                    onPressed: () => _showContextMenu(item.id),
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                // Context Menu
                                if (isSelected)
                                  Positioned(
                                    top: 8,
                                    right: 16,
                                    child: Material(
                                      elevation: 8,
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minWidth: 160,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.grey[300]!,
                                            width: 1,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            _buildMenuItem(
                                              icon: Icons.share,
                                              label: 'Поделиться',
                                              onTap: () => _shareItem(item.id),
                                            ),
                                            _buildMenuItem(
                                              icon: Icons.bookmark_border,
                                              label: 'Бронировать артикул',
                                              onTap: () => _reserveItem(item.id),
                                            ),
                                            _buildMenuItem(
                                              icon: Icons.delete_outline,
                                              label: 'Удалить',
                                              onTap: () => _removeItem(item.id),
                                              iconColor: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: iconColor ?? const Color(0xFF282A51),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: iconColor ?? const Color(0xFF282A51),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
