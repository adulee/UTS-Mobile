import 'package:flutter/material.dart';

class MyCurrencyConverterApp extends StatelessWidget {
  const MyCurrencyConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konversi Mata Uang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CurrencyConverterPage(),
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({Key? key}) : super(key: key);

  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double usdAmount = 0;
  double convertedAmount = 0;
  double exchangeRate = 15621.10;

  void convertCurrency() {
    setState(() {
      convertedAmount = usdAmount * exchangeRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Masukan Jumlah dalam USD'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  usdAmount = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(
              'Dalam Rupiah: $convertedAmount',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}