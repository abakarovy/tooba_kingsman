import 'package:flutter/material.dart';
import 'package:kingsman_mobileapp/features/auth/presentation/login_page.dart';
import 'package:kingsman_mobileapp/features/auth/presentation/registration_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Фоновое изображение
          Image.asset(
            'assets/images/mainBackground.png',
            fit: BoxFit.cover,
          ),
          // Основное содержимое
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Логотип
                Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                ),
                const SizedBox(height: 16),
                const Text(
                  'MR.KINGSMAN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xff282A51),
                    letterSpacing: 2,
                  ),
                ),
                const Text(
                  'МУЖСКАЯ ОДЕЖДА И АКСЕССУАРЫ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff282A51),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 48),
                // Кнопки
                SizedBox(
                  width: 220,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => const RegistrationPage())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff282A51),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size.fromHeight(44),
                        ),
                        child: const Text('Регистрация'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => const LoginPage())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size.fromHeight(44),
                        ),
                        child: const Text('Вход'),
                      ),
                    ],
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