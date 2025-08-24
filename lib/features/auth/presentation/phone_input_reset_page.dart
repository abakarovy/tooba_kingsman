import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:kingsman_mobileapp/features/auth/presentation/password_reset_page.dart';

class PhoneInputResetPage extends StatefulWidget {
  final void Function(String phone)? onNext;
  const PhoneInputResetPage({Key? key, this.onNext}) : super(key: key);

  @override
  State<PhoneInputResetPage> createState() => _PhoneInputResetPageState();
}

class _PhoneInputResetPageState extends State<PhoneInputResetPage> {
  final TextEditingController _phoneController = TextEditingController();

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
                      const SizedBox(height: 48),
                      const Text(
                        'Введите ваш номер телефона',
                        style: TextStyle(
                          color: Color(0xFF282A51),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.black,
                        inputFormatters: [
                          PhoneInputFormatter(
                            defaultCountryCode: 'RU',
                            allowEndlessPhone: false
                          )
                        ],
                        style: const TextStyle(fontSize: 22, color: Color(0xFF282A51)),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.only(topLeft:  Radius.circular(4), topRight:  Radius.circular(16), bottomLeft:  Radius.circular(16), bottomRight:  Radius.circular(16)),
                            
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black,),
                            borderRadius: BorderRadius.only(topLeft:  Radius.circular(4), topRight:  Radius.circular(16), bottomLeft:  Radius.circular(16), bottomRight:  Radius.circular(16))
                          ),
                          hintText: '+7 (_ _ _)  _ _ _  _ _  _ _',
                          fillColor: Colors.transparent,
                          hintStyle: TextStyle(fontSize: 22, color: Color(0xFF282A51)),
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(height: 24),
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
                          onPressed: () {
                            if (isPhoneValid(_phoneController.text)) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => const PasswordResetPage())
                              );
                            }
                          },
                          child: const Text('Далее', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
