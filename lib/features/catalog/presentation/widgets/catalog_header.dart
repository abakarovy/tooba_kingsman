import 'package:flutter/material.dart';
import 'package:kingsman_mobileapp/features/chat/presentation/ai_chat_page.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF282A51),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Logo and Brand
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'MR.KINGSMAN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'МУЖСКАЯ ОДЕЖДА И АКСЕССУАРЫ',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          // Chat Icon
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AiChatPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
