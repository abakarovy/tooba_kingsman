import 'package:flutter/material.dart' hide SearchBar;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kingsman_mobileapp/features/catalog/presentation/widgets/catalog_header.dart';
import 'package:kingsman_mobileapp/features/catalog/presentation/widgets/search_bar.dart';
import 'package:kingsman_mobileapp/features/catalog/presentation/widgets/category_filters.dart';
import 'package:kingsman_mobileapp/features/catalog/presentation/widgets/product_row.dart';
import 'package:kingsman_mobileapp/features/catalog/presentation/widgets/call_to_action_buttons.dart';
import 'package:kingsman_mobileapp/features/catalog/domain/models/product_item.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  void initState() {
    super.initState();
    // Ensure the page is properly initialized
  }

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
                // Header Section
                const CatalogHeader(),
                // Search Bar
                const SearchBar(),
                // Main Categories
                const MainCategoryFilters(),
                // Sub Categories
                const SubCategoryFilters(),
                // Product Rows
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductRow(
                          title: "НОВИНКИ",
                          products: [
                            ProductItem(
                              name: "Рубашка КЛАССИКА (кат 101)",
                              price: "от 5 500 ₽",
                              image: "assets/images/shirt_classic.png",
                            ),
                            ProductItem(
                              name: "Рубашка КЛАССИКА (кат 101)",
                              price: "от 5 500 ₽",
                              image: "assets/images/shirt_classic.png",
                            ),
                            ProductItem(
                              name: "Джинсы СЛИМ (кат 102)",
                              price: "от 8 900 ₽",
                              image: "assets/images/jeans.png",
                            ),
                          ],
                        ),
                        ProductRow(
                          title: "ПОПУЛЯРНОЕ",
                          products: [
                            ProductItem(
                              name: "Костюм ДЕЛОВОЙ (кат 103)",
                              price: "от 25 000 ₽",
                              image: "assets/images/costume.png",
                            ),
                            ProductItem(
                              name: "Свитер ВЯЗАНЫЙ (кат 104)",
                              price: "от 12 500 ₽",
                              image: "assets/images/sweater.png",
                            ),
                            ProductItem(
                              name: "Футболка БАЗОВАЯ (кат 105)",
                              price: "от 3 900 ₽",
                              image: "assets/images/shirt.png",
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Call to Action Buttons
                        const CallToActionButtons(),
                        const SizedBox(height: 32),
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
