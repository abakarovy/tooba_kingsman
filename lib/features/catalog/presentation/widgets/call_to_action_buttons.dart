import 'package:flutter/material.dart';

class CallToActionButtons extends StatelessWidget {
  const CallToActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Open stylist appointment
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'ОНЛАЙН ЗАПИСЬ К СТИЛИСТУ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              // TODO: Make phone call
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF282A51),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
            ),
            child: const Icon(Icons.phone, size: 20),
          ),
        ],
      ),
    );
  }
}
