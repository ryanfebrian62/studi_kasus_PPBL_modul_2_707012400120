import 'package:flutter/material.dart';

class DetailLayananPage extends StatelessWidget {
  const DetailLayananPage({
    super.key,
    required this.nama,
    required this.dinas,
    required this.jam,
    required this.keterangan,
  });

  final String nama;
  final String dinas;
  final String jam;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Detail Layanan'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.description,
              size: 70,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            Text(
              nama,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Dinas Penanggung Jawab',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(dinas),

            const SizedBox(height: 16),

            const Text(
              'Jam Operasional',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(jam),

            const SizedBox(height: 16),

            const Text(
              'Keterangan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(keterangan),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    'Permohonan "$nama" berhasil diajukan.',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Ajukan Permohonan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}