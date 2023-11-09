import 'package:flutter/material.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({Key? key}) : super(key: key);

  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  double weight = 0;
  double height = 0;
  double bmi = 0;
  String bmiCategory = '';

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
      // Tentukan kategori berdasarkan nilai BMI
      if (bmi < 18.5) {
        bmiCategory = 'Berat badan kurang / Kurus';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        bmiCategory = 'Berat badan ideal';
      } else if (bmi >= 24.9 && bmi < 29.9) {
        bmiCategory = 'Berat badan berlebih';
      } else if (bmi >= 29.9) {
        bmiCategory = 'Obesitas';
      } else {
        bmiCategory = 'Tidak Diketahui';
      }
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
              decoration: InputDecoration(labelText: 'Masukkan Berat (kg)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Masukkan Tinggi (cm)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 20),
            Text(
              'BMI: $bmi',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Kategori BMI: $bmiCategory',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}