import 'package:flutter/material.dart';

class MainCategoryFilters extends StatelessWidget {
  const MainCategoryFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ['КАТАЛОГ', 'НОВИНКИ', 'ОБУВЬ', 'АКСЕССУАРЫ', 'БЕЛЬЕ', 'ОБУВНАЯ КОСМЕТИКА'];
    
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isActive = categories[index] == 'НОВИНКИ'; // Default active
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Handle category selection
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isActive ? Colors.grey[300] : const Color(0xFF282A51),
                foregroundColor: isActive ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(
                categories[index],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SubCategoryFilters extends StatelessWidget {
  const SubCategoryFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subCategories = ['Брюки', 'Джинсы', 'Верхняя одежда', 'Костюмы', 'Рубашки', 'Свитера', 'Спортивни', 'Футболки'];
    
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          final isActive = subCategories[index] == 'Брюки'; // Default active
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Handle sub-category selection
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isActive ? Colors.black : Colors.grey[300],
                foregroundColor: isActive ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 0,
              ),
              child: Text(
                subCategories[index],
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
