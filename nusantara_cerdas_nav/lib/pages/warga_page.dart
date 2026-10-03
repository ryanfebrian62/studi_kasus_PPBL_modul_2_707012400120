import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            'Kelola laporan dan kebutuhan warga melalui '
            'layanan yang tersedia.',
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 24),

          const Text(
            'Layanan Favorit',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Consumer<FavoritModel>(
            builder: (context, favorit, child) {
              if (favorit.layananFavorit.isEmpty) {
                return const Card(
                  child: ListTile(
                    leading: Icon(Icons.star_border, color: Colors.grey),
                    title: Text('Belum ada layanan favorit'),
                  ),
                );
              }

              return Column(
                children: favorit.layananFavorit.map((nama) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.star, color: Colors.amber),
                      title: Text(nama),
                    ),
                  );
                }).toList(),
              );
            },
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
