import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEDE9E2),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/mainBackground.png', fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', width: 120),
                const SizedBox(height: 16),
                const Text(
                  'Добро пожаловать в MR.KINGSMAN',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF282A51),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Главная страница',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF282A51),
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
