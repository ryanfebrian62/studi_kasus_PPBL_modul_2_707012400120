import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';

class DetailLayananPage extends StatefulWidget {
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
  State<DetailLayananPage> createState() => _DetailLayananPageState();
}

class _DetailLayananPageState extends State<DetailLayananPage> {
  bool _sedangMengirim = false;

  Future<void> _ajukanPermohonan() async {
    setState(() {
      _sedangMengirim = true;
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (!mounted) return;

    context.read<PengajuanModel>().tambahPengajuan(
          widget.nama,
        );

    setState(() {
      _sedangMengirim = false;
    });

    Navigator.pop(
      context,
      'Permohonan "${widget.nama}" berhasil diajukan.',
    );
  }

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
              widget.nama,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Dinas Penanggung Jawab',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(widget.dinas),

            const SizedBox(height: 16),

            const Text(
              'Jam Operasional',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(widget.jam),

            const SizedBox(height: 16),

            const Text(
              'Keterangan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(widget.keterangan),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:
                    _sedangMengirim ? null : _ajukanPermohonan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: _sedangMengirim
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
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