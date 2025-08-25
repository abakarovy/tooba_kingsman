import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kingsman_mobileapp/features/auth/presentation/main_page.dart';
import 'package:kingsman_mobileapp/features/catalog/presentation/catalog_page.dart';
import 'package:kingsman_mobileapp/features/cart/presentation/cart_page.dart';
import 'package:kingsman_mobileapp/features/waitingList/presentation/waiting_list_page.dart';
import 'package:kingsman_mobileapp/features/profile/presentation/profile_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DiscountCardPage extends StatefulWidget {
  const DiscountCardPage({Key? key}) : super(key: key);

  @override
  State<DiscountCardPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountCardPage>{
  bool _menuOpen = false;
  late Widget? qrWidget;
  late double qrSize = 120;
  int _currentIndex = 1; // Start with discount card page

  String qrLink = 'https://tbank.ru/cf/61QjJ37firm';

  void _toggleMenu() {
    setState(() {
      _menuOpen = !_menuOpen;
    });
  }

  void _updateQrSize(data, size) {
    if (qrSize == size) return;
    qrSize = size;
    qrWidget = null;
    setState(() {
      qrWidget = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: QrImageView(
        data: data,
        version: QrVersions.auto,
        size: size,
        backgroundColor: Colors.transparent,
      )
    );
    });
  }

  void _onNavigationTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return const CatalogPage(key: ValueKey('catalog_page'));
      case 1:
        return const WaitingListPage();
      case 2:
        return const CartPage();
      case 3:
        return const ProfilePage();
      case 4:
        return _buildDiscountCardPage();
      default:
        return _buildDiscountCardPage();
      }
  }

  Widget _buildDiscountCardPage() {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = width * 0.9 > 400 ? 400.0 : width * 0.9;
    final cardHeight = cardWidth * 1.2;

    _updateQrSize(qrLink, cardHeight * 0.325);
    
    return Container(
      color: const Color(0xFFEDE9E2),
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
                  'assets/images/logo.png',
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
                      style: TextStyle(fontSize: 25, color: Colors.black87),
                    ),
                  ),
                ),
                // Карта
                Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(28),
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                      onTap: showQrMagnified,
                      child: Container(
                        width: cardWidth,
                        height: cardHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFF282A51),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(28),
                            bottomLeft: Radius.circular(28),
                            bottomRight: Radius.circular(28),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 6,
                              offset: const Offset(8, 8),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(28),
                            bottomLeft: Radius.circular(28),
                            bottomRight: Radius.circular(28),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // Фоновое изображение для карты
                              Image.asset(
                                'assets/images/cardBg.png',
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
                                              fontFamily: 'Gotham Pro',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4,
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          child: qrWidget ?? CircularProgressIndicator(),
                                        ),
                                      ],
                                    ),
                                    // -10%
                                    Text(
                                      '-10%',
                                      style: TextStyle(
                                        fontSize: cardHeight * 0.23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    // Gentleman badge
                                    const Spacer(),
                                    // Прогресс-бар и уровень
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
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
                                        const Text(
                                          'До уровня Sir: 3 000 ₽ из 10 000 ₽',
                                          overflow: TextOverflow.clip,
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
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Где нас найти?',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            SizedBox(height: 8),
                            Text('Галерея Времена Года', style: TextStyle(color: Colors.black, fontSize: 12)),
                            Text('Тверская 7', style: TextStyle(color: Colors.black, fontSize: 12)),
                            Text('Балтийская 7', style: TextStyle(color: Colors.black, fontSize: 12)),
                            Text('Ленинская 37', style: TextStyle(color: Colors.black, fontSize: 12)),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'График 10:00 – 21:00',
                                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Center Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Контакты',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '+7 (999) 123-45-67',
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                            SizedBox(height: 6),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'info@mrkingsman.ru',
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Right Column
                      Flexible(
                        flex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset('assets/images/logo.png', height: 28, width: 28, color: Colors.black),
                            SizedBox(height: 4),
                            Text(
                              '@MR.KINGSMAN',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              children: [
                                Icon(Icons.language, size: 20, color: Colors.black), // VK
                                Icon(Icons.send, size: 20, color: Colors.black), // Telegram
                                Icon(Icons.camera_alt, size: 20, color: Colors.black), // Instagram
                              ],
                            ),
                          ],
                        ),
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
            child: IconButton(onPressed: _toggleMenu, icon: Icon(Icons.menu, color: Colors.black))
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
                          setState(() => _menuOpen = false);
                          showProfileDialog(context);
                        },
                        icon: const Icon(Icons.person, color: Colors.white),
                        label: const Text('Мой профиль', style: TextStyle(color: Colors.white)),
                        style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() => _menuOpen = false);
                          showNotificationDialog();
                        },
                        icon: const Icon(Icons.notifications, color: Colors.white),
                        label: const Text('Уведомления', style: TextStyle(color: Colors.white)),
                        style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                      ),
                      const Divider(color: Colors.white24),
                      TextButton(
                        onPressed: () {
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
    );
  }

  void showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.5,
            child: Container(
                child: Column(
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Личные данные'),
                        IconButton(onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.close))
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        TextField(
                          style: TextStyle(color: Color(0xff282A51)),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff282A51), width: 2)),
                            label: Text('ФИО'),
                          ),
                        ),
                        SizedBox(height: 16,),
                        TextField(
                          style: TextStyle(color: Color(0xff282A51)),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff282A51), width: 2)),
                            label: Text('Пароль'),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Color(0xff282A51),
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Column(
                                children: [
                                  Text('Номер телефона', style: TextStyle(color: Colors.white60),),
                                  Text('+7 (___) ___-__-__', style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                            Container(
                              child: Image.asset('assets/images/logo.png', width: 40, height: 40, color: Color(0xff282A51),),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )
              )
          ) 
        );
      }
    );
  }

  void showNotificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.4,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.close))
                    ],
                  ),
                  Text('Разрешить\nMR. KINGSMAN\nотправлять\nуведомления?', style: TextStyle(fontSize: 20, color: Color(0xff282A51), fontWeight: FontWeight.w700),),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Expanded(
                        child: Text('Отправляйте мне уведомления', maxLines: 4, overflow: TextOverflow.visible, softWrap: true)
                      )
                    ],
                  ),
                  const Spacer(),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/logo.png', color: Color(0xff282A51), height: 40, width: 40,)
                    ],
                  ),
                  const Spacer()
                ]
              )
            ),
          )
        );
      }
    );
  }

  void showQrMagnified() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Builder(
            builder: (context) {
              final screenWidth = MediaQuery.of(context).size.width;
              final dialogWidth = screenWidth * 0.9;
              final maxDialogWidth = 400.0;
              return Container(
                width: dialogWidth > maxDialogWidth ? maxDialogWidth : dialogWidth,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    SizedBox(height: 8),
                    QrImageView(
                      data: qrLink,
                      version: QrVersions.auto,
                      size: 240, // Large size for easy scanning
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(height: 30,),
                    Text(
                      'Отсканируйте QR-код',
                      style: TextStyle(fontSize: 16, color: Color(0xff282A51), fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    qrWidget = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: QrImageView(
        data: qrLink,
        version: QrVersions.auto,
        size: qrSize,
        backgroundColor: Colors.white,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE9E2),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF282A51),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
              onPressed: () {
                _onNavigationTapped(0);
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.clock, color: Colors.white),
              onPressed: () {
                _onNavigationTapped(1);
              },
            ),
            const SizedBox(width: 40), // Space for FAB
            IconButton(
              icon: const Icon(FontAwesomeIcons.shoppingCart, color: Colors.white),
              onPressed: () {
                _onNavigationTapped(2);
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.user, color: Colors.white),
              onPressed: () {
                _onNavigationTapped(3);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF282A51),
        onPressed: () {
          _onNavigationTapped(4); // New index for discount card page
        },
        child: const Icon(FontAwesomeIcons.sheetPlastic, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: _getCurrentPage(),
      ),
    );
  }
}