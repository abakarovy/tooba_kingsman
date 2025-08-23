import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:kingsman_mobileapp/features/discountCard/presentation/discount_card_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _phoneController = TextEditingController();
  final _smsController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordVerifyController = TextEditingController();

  String phoneNum = '';
  bool _phoneFieldEnabled = true;
  bool _smsFieldEnabled = true;
  bool _isLoading = false;
  bool _codeSent = false;
  bool _codeVerified = false;
  bool _passwordsValidated = true;

  void _sendCode() {
    setState(() { _isLoading = true; });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        _codeSent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('код отправлен'), duration: Duration(seconds: 2)),
      );
    });
  }

  void _verifyCode(String value) {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _codeVerified = true;
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('код подтвержден'), duration: Duration(seconds: 1)),
      );
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => const DiscountCardPage()),
      // );
    });
  }

  void onPhoneFieldChanged(String value) {
    setState(() { phoneNum = value; });
  }

  void onSmsFieldChanged(String value) {
    if (value.length == 5) {
      setState(() {
        _smsFieldEnabled = false;
        _isLoading = true;
      });
      _verifyCode(value);
    }
  }

  void onRegisterRequest() {
    var password = _passwordController.text;
    var passwordVerify = _passwordVerifyController.text;

    if (password == passwordVerify) {
      setState(() {
        _passwordsValidated = true;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DiscountCardPage())
      );
    
    } else {
      setState(() {
        _passwordsValidated = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            './assets/images/mainBackground.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(24),
                ),
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Регистрация',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Color(0xff282A51)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    if (!_codeSent) ...[
                      TextField(
                        onChanged: onPhoneFieldChanged,
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        enabled: _phoneFieldEnabled,
                        inputFormatters: [
                          PhoneInputFormatter(
                            defaultCountryCode: 'RU',
                            allowEndlessPhone: false,
                          ),
                        ],
                        style: const TextStyle(color: Color(0xff282A51)),
                        decoration: const InputDecoration(
                          labelText: 'Номер телефона',
                          hintText: '+7 _ _ _  _ _ _  _ _  _ _',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: !_isLoading ? _sendCode : null,
                        label: const Text('Получить код'),
                        icon: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xff282A51)),
                              )
                            : const Icon(Icons.send, color: Color(0xff282A51),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xff282A51),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xff282A51), width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                    if (_codeSent && !_codeVerified) ...[
                      Text(
                        'Код отправлен на номер $phoneNum',
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        onChanged: onSmsFieldChanged,
                        controller: _smsController,
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        enabled: _smsFieldEnabled,
                        style: const TextStyle(color: Color(0xff282A51)),
                        decoration: InputDecoration(
                          labelText: 'SMS-код',
                          hintText: '_ _ _ _ _',
                          border: const OutlineInputBorder(),
                          counterText: '',
                          suffixIcon: _isLoading
                              ? const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xff282A51))),
                                )
                              : null,
                        ),
                      ),
                    ],
                    if (_codeVerified)...[
                      TextField(
                        controller: _passwordController,
                        style: TextStyle(color: Color(0xff282A51)),
                        decoration: InputDecoration(
                          label: Text('Придумайте пароль'),
                          errorText: !_passwordsValidated ? 'Пароли не совпадают' : null
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        controller: _passwordVerifyController,
                        style: TextStyle(color: Color(0xff282A51)),
                        decoration: InputDecoration(
                          label: Text('Подтвердите пароль'),
                          errorText: !_passwordsValidated ? 'Пароли не совпадают' : null
                        ),
                      ),
                      SizedBox(height: 30,),
                      ElevatedButton(onPressed: onRegisterRequest, child: Text('Зарегестрироваться'))
                    ]
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}