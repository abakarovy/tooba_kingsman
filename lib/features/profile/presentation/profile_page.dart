import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                const Icon(
                  FontAwesomeIcons.user,
                  size: 80,
                  color: Color(0xFF282A51),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Профиль',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF282A51),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Управление личными данными',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF282A51),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Show profile dialog
                  },
                  child: const Text('Открыть профиль'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
