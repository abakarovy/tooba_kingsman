import 'package:flutter/material.dart';
import 'package:kingsman_mobileapp/features/auth/presentation/main_page.dart';

class PasswordNewPage extends StatefulWidget {
  const PasswordNewPage({Key? key}) : super(key: key);

  @override
  State<PasswordNewPage> createState() => _PasswordNewPageState();
}

class _PasswordNewPageState extends State<PasswordNewPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController = TextEditingController();

  void passwordChangeRequest() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE9E2),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/mainBackground.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ВОССТАНОВЛЕНИЕ\nПАРОЛЯ',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF282A51),
                          fontFamily: 'Gotham Pro',
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Придумайте новый  пароль',
                        style: TextStyle(
                          color: Color(0xFF282A51),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordRepeatController,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Color(0xff282A51)),
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff282A51)),
                            borderRadius: BorderRadius.only(topLeft:  Radius.circular(4), topRight:  Radius.circular(16), bottomLeft:  Radius.circular(16), bottomRight:  Radius.circular(16))
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff282A51), width: 2),
                            borderRadius: BorderRadius.only(topLeft:  Radius.circular(4), topRight:  Radius.circular(16), bottomLeft:  Radius.circular(16), bottomRight:  Radius.circular(16))
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(topLeft:  Radius.circular(4), topRight:  Radius.circular(16), bottomLeft:  Radius.circular(16), bottomRight:  Radius.circular(16))
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Подтвердите пароль',
                        style: TextStyle(
                          color: Color(0xFF282A51),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordRepeatController,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Color(0xff282A51)),
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff282A51)),
                            borderRadius: BorderRadius.only(topLeft:  Radius.circular(4), topRight:  Radius.circular(16), bottomLeft:  Radius.circular(16), bottomRight:  Radius.circular(16))
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff282A51), width: 2),
                            borderRadius: BorderRadius.only(topLeft:  Radius.circular(4), topRight:  Radius.circular(16), bottomLeft:  Radius.circular(16), bottomRight:  Radius.circular(16))
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(topLeft:  Radius.circular(4), topRight:  Radius.circular(16), bottomLeft:  Radius.circular(16), bottomRight:  Radius.circular(16))
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF282A51),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: passwordChangeRequest,
                          child: const Text('Завершить', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 48,
                        color: Color(0xFF282A51),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'MR.KINGSMAN',
                        style: TextStyle(
                          color: Color(0xFF282A51),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
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
