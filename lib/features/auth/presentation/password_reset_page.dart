import 'package:flutter/material.dart';
import 'package:kingsman_mobileapp/features/auth/presentation/password_new_page.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final TextEditingController _smsController = TextEditingController();
  int _secondsLeft = 60;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Start timer for resend (not functional, just for UI demo)
    // In real app, use Timer.periodic
  }

  void onChanged(String value) {
    if (value.length == 5) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const PasswordNewPage())
        );
      });
    }
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
                      const SizedBox(height: 48),
                      const Text(
                        'Код отправлен на номер: +7 (XXX) XXX-XX-XX',
                        style: TextStyle(
                          color: Color(0xFF282A51),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Введите код из сообщения!',
                        style: TextStyle(
                          color: Color(0xFF282A51),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextField(
                        onChanged: onChanged,
                        controller: _smsController,
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Color(0xff282A51)),
                        decoration: InputDecoration(
                          labelText: 'SMS-код',
                          hintText: '_ _ _ _ _',
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
                          counterText: '',
                          suffixIcon: _isLoading
                              ? const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xff282A51))),
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Повторная отправка SMS через',
                        style: TextStyle(fontSize: 12, color: Color(0xFF282A51)),
                      ),
                      Text(
                        '$_secondsLeft сек',
                        style: const TextStyle(fontSize: 12, color: Color(0xFF282A51)),
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
