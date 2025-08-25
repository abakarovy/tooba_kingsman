import 'package:flutter/material.dart';
import 'package:kingsman_mobileapp/features/catalog/domain/models/product_item.dart';

class CatalogItemPage extends StatelessWidget {
  final ProductItem product;

  const CatalogItemPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE9E2),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/mainBackground.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                // Header with back button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Color(0xFF282A51)),
                        onPressed: () {
                          // Navigate back to the main app with catalog page active
                          Navigator.of(context).pop();
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'Детали товара',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF282A51),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Product Image
                Container(
                  height: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/cardBg.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Product Details
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(20),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF282A51),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Product Price
                        Text(
                          product.price,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF282A51),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Product Description
                        const Text(
                          'Описание товара',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF282A51),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Высококачественный товар от MR.KINGSMAN. Изготовлен из премиальных материалов с вниманием к деталям. Идеально подходит для современного мужчины, который ценит качество и стиль.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Size Selection
                        const Text(
                          'Размер',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF282A51),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          children: ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
                            return ChoiceChip(
                              label: Text(size),
                              selected: size == 'M',
                              onSelected: (selected) {
                                // TODO: Handle size selection
                              },
                              selectedColor: const Color(0xFF282A51),
                              labelStyle: TextStyle(
                                color: size == 'M' ? Colors.white : const Color(0xFF282A51),
                              ),
                            );
                          }).toList(),
                        ),
                        const Spacer(),
                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: Add to cart
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
                                  'Добавить в корзину',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () {
                                // TODO: Contact stylist
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300],
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Icon(Icons.chat_bubble_outline),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
