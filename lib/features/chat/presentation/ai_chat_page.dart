import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AiChatPage extends StatelessWidget {
  const AiChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE9E2),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/secondaryBackground.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Header
                Container(
                  color: const Color(0xFF282A51),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Image.asset('assets/images/logo.png', width: 32, height: 32, color: Colors.white),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'MR.KINGSMAN',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'ЦИФРОВОЙ СТИЛИСТ',
                              style: TextStyle(color: Colors.white70, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),

                // Top CTA
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: const Text(
                      'АНАЛИЗ ВНЕШНОСТИ',
                      style: TextStyle(color: Color(0xFF282A51), fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                // Chat content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Assistant bubble
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _bubble(
                            context,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Здравствуйте [имя]\nЯ – цифровой стилист MR.KINGSMAN.',
                                  style: TextStyle(color: Colors.black87, fontSize: 12),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Загрузите вашу фотографию в полный рост',
                                  style: TextStyle(color: Colors.black54, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Image placeholders row
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 6)),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _imagePlaceholder(),
                                const SizedBox(width: 12),
                                _imagePlaceholder(dim: true),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Assistant offer with mini-cards
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _bubble(
                            context,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Отлично!\nЯ анализирую...', style: TextStyle(fontSize: 12, color: Colors.black87)),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _miniCard(),
                                      _miniCard(),
                                      _miniCard(),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFF282A51),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    child: const Text('ПЕРЕЙТИ'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),

                // Bottom action row mimicking design
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    children: [
                      _roundedIcon(Icons.image_outlined),
                      const SizedBox(width: 12),
                      _roundedIcon(FontAwesomeIcons.whatsapp),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4)),
                          ],
                        ),
                        child: const Text(
                          'АНАЛИЗ ВНЕШНОСТИ',
                          style: TextStyle(color: Color(0xFF282A51), fontWeight: FontWeight.w600),
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

  Widget _bubble(BuildContext context, {required Widget child}) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 48),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: child,
    );
  }

  Widget _imagePlaceholder({bool dim = false}) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        color: dim ? Colors.grey[300] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.image_outlined, size: 36, color: Colors.white70),
    );
  }

  Widget _miniCard() {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AspectRatio(
            aspectRatio: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFFE0E0E0), borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Icon(Icons.image_outlined, color: Colors.white70),
            ),
          ),
          SizedBox(height: 6),
          Text('джинсы', style: TextStyle(fontSize: 9, color: Colors.black54)),
          SizedBox(height: 2),
          Text('от 7 900 ₽', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF282A51))),
        ],
      ),
    );
  }

  Widget _roundedIcon(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: Icon(icon, color: const Color(0xFF282A51)),
    );
  }
}
