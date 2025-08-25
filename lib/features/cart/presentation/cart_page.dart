import 'package:flutter/material.dart';
import 'package:kingsman_mobileapp/features/cart/domain/models/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _cartItems = [
    CartItem(
      id: '1',
      name: 'Джинсы BOTTEGA 5667 200',
      price: 'от 7 900 ₽',
      image: 'assets/images/cardBg.png',
    ),
    CartItem(
      id: '2',
      name: 'Рубашка классическая',
      price: 'от 5 500 ₽',
      image: 'assets/images/cardBg.png',
    ),
    CartItem(
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

  void _removeItem(String itemId) {
    setState(() {
      _cartItems.removeWhere((item) => item.id == itemId);
      _selectedItemId = null;
    });
  }

  void _copyItem(String itemId) {
    // TODO: Implement copy functionality
    setState(() {
      _selectedItemId = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Товар скопирован')),
    );
  }

  void _sellItem(String itemId) {
    // TODO: Implement sell functionality
    setState(() {
      _selectedItemId = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Функция продажи в разработке')),
    );
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
                                'КОРЗИНА',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.shopping_cart,
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
              // Cart Items
              Expanded(
                child: _cartItems.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 64,
                              color: Color(0xFF282A51),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Корзина пуста',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF282A51),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Добавьте товары из каталога',
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
                        itemCount: _cartItems.length,
                        itemBuilder: (context, index) {
                          final item = _cartItems[index];
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
                                    color: const Color(0xFF282A51),
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
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      // Order Button
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     // TODO: Implement order functionality
                                      //   },
                                      //   style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white,
                                      //     foregroundColor: const Color(0xFF282A51),
                                      //     padding: const EdgeInsets.symmetric(
                                      //       horizontal: 16,
                                      //       vertical: 8,
                                      //     ),
                                      //     shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(8),
                                      //     ),
                                      //   ),
                                      //   child: const Text(
                                      //     'ЗАКАЗАТЬ',
                                      //     style: TextStyle(
                                      //       fontSize: 12,
                                      //       fontWeight: FontWeight.bold,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                // Context Menu Button
                                Positioned(
                                  top: 16,
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
                                          minWidth: 140,
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
                                              icon: Icons.delete_outline,
                                              label: 'Удалить',
                                              onTap: () => _removeItem(item.id),
                                            ),
                                            _buildMenuItem(
                                              icon: Icons.copy,
                                              label: 'Скопировать',
                                              onTap: () => _copyItem(item.id),
                                            ),
                                            _buildMenuItem(
                                              icon: Icons.sell,
                                              label: 'Продать',
                                              onTap: () => _sellItem(item.id),
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
              // Bottom Summary (if cart has items)
              if (_cartItems.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Итого товаров:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${_cartItems.length}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF282A51),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement checkout functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF282A51),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'ОФОРМИТЬ ЗАКАЗ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
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
              color: const Color(0xFF282A51),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF282A51),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
