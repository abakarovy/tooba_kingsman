import 'package:flutter/material.dart';
import 'package:kingsman_mobileapp/features/auth/presentation/main_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DiscountCardPage extends StatefulWidget {
  const DiscountCardPage({Key? key}) : super(key: key);

  @override
  State<DiscountCardPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountCardPage>{
  bool _menuOpen = false;
  late QrImageView qrWidget;

  void _toggleMenu() {
    setState(() {
      _menuOpen = !_menuOpen;
    });
  }

  void _updateQrSize(data, size) {
    if (qrWidget.size! == size) return;
    qrWidget = QrImageView(
      data: data,
      version: QrVersions.auto,
      backgroundColor: Colors.white,
      size: size,
    );
  }

  @override
  void initState() {
    super.initState();
    qrWidget = QrImageView(
      data: 'https://habr.com/ru/search/?q=firebase+push&target_type=posts&order=relevance',
      version: QrVersions.auto,
      size: 120,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = width * 0.9 > 400 ? 400.0 : width * 0.9;
    final cardHeight = cardWidth * 1.2;

    _updateQrSize('https://habr.com/ru/search/?q=firebase+push&target_type=posts&order=relevance', cardHeight * 0.325);
    return Scaffold(
      backgroundColor: const Color(0xFFEDE9E2),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/mainBackground.png', fit: BoxFit.cover),
            ),
            SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(height: 24),
                  // Логотип
                  Image.asset(
                    'assets/images/logo.png', // ваш логотип
                    width: 120,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'MR.KINGSMAN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                  const Text(
                    'МУЖСКАЯ ОДЕЖДА И АКСЕССУАРЫ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Текст "Ваша скидочная карта"
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.0, bottom: 8),
                      child: Text(
                        'Ваша скидочная карта',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                  ),
                  // Карта
                  Center(
                    child: Container(
                      width: cardWidth,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xFF282A51),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Фоновое изображение для карты
                            Image.asset(
                              'assets/images/cardBg.png', // замените на ваш путь
                              fit: BoxFit.cover,
                            ),
                            // Полупрозрачный слой (опционально)
                            Container(
                              color: Colors.black.withOpacity(0.08),
                            ),
                            // Основное содержимое карты
                            Padding(
                              padding: EdgeInsets.all(cardHeight * 0.07),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Имя и QR-код
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Имя',
                                          style: TextStyle(
                                            fontSize: cardHeight * 0.11,
                                            color: Colors.white,
                                            fontFamily: 'Georgia',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4,
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(4),
                                        child: qrWidget,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: cardHeight * 0.08),
                                  // -10%
                                  Text(
                                    '-10%',
                                    style: TextStyle(
                                      fontSize: cardHeight * 0.23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // const Spacer(),
                                  // Gentleman badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'Gentleman',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF282A51),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  // Прогресс-бар и уровень
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'До уровня Sir: 3 000 ₽ из 10 000 ₽',
                                        softWrap: false,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: LinearProgressIndicator(
                                          value: 0.3, // 3 000 из 10 000
                                          minHeight: 6,
                                          backgroundColor: Colors.white24,
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Футер
                  Container(
                    width: cardWidth,
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Где нас найти?',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Контакты',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Галерея Времена Года\nТверская 7\nБалтийская 7\nЛенинская 37',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '7 (999) 123-45-67',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Для заказа перейдите по ссылке',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.vaccines, color: Colors.white),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.telegram, color: Colors.white),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(onPressed: _toggleMenu, icon: Icon(Icons.menu,))
            ),
            if (_menuOpen)...[
              Positioned(
                top: 16+40,
                right: 16,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 180,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(100),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(100),
                          blurRadius: 16,
                          offset: const Offset(0, 8)
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 30,),
                        TextButton.icon(
                          onPressed: () {
                            // TODO: Навигация на профиль
                            setState(() => _menuOpen = false);
                          },
                          icon: const Icon(Icons.person, color: Colors.white),
                          label: const Text('Мой профиль', style: TextStyle(color: Colors.white)),
                          style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // TODO: Навигация на уведомления
                            setState(() => _menuOpen = false);
                          },
                          icon: const Icon(Icons.notifications, color: Colors.white),
                          label: const Text('Уведомления', style: TextStyle(color: Colors.white)),
                          style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                        ),
                        const Divider(color: Colors.white24),
                        TextButton(
                          onPressed: () {
                            // TODO: Выйти
                            setState(() => _menuOpen = false);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => const MainPage())
                            );
                          },
                          child: const Text('Выйти', style: TextStyle(color: Colors.white)),
                          style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}