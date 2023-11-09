import 'package:flutter/material.dart';

class CalculatorHistoryPage extends StatelessWidget {
  const CalculatorHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator History'),
      ),
      body: ListView.builder(
        itemCount: 10, // Ganti jumlah histori sesuai kebutuhan
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Calculation $index'), // Ganti dengan konten histori yang sesuai
            onTap: () {
              // Aksi saat item histori diklik
              // Misalnya, tampilkan detail histori atau lakukan aksi lain
            },
          );
        },
      ),
    );
  }
}