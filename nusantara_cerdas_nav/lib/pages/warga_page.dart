import 'package:flutter/material.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.people, size: 80, color: Colors.blue),

          const SizedBox(height: 20),

          const Text(
            'Layanan Warga',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          const Text(
            'Kelola laporan yang telah anda ajukan',
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/riwayat-laporan');
              },
              icon: const Icon(Icons.history),
              label: const Text('Riwayat Laporan'),
            ),
          ),
        ],
      ),
    );
  }
}
