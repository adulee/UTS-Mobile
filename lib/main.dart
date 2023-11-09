import 'package:flutter/material.dart';
import 'kalkulator.dart';
import 'konversi.dart'; // Sesuaikan dengan path file konversi.dart
//import 'login_service.dart';
//import 'login.dart';
import 'profile.dart';
import 'bmi.dart';
import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false; // Ganti dengan logika pengecekan login yang sesungguhnya

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS MOBILE', // Judul aplikasi di header
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: const Color.fromARGB(255, 18, 17, 18)),
      ),
      home: isLoggedIn ? const MyHomePage() : SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<String> _appBarTitles = ['Profile Page', 'Calculator', 'Currency Converter', 'BMI Calculator']; // Menyesuaikan urutan dengan tata letaknya

  static const List<Widget> _widgetOptions = <Widget>[
    const ProfilePage(), // Halaman profil
    const MyCalculatorApp(), // Kalkulator
    const MyCurrencyConverterApp(), // Konversi Mata Uang
    const BMICalculator(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(_appBarTitles[_selectedIndex]), // Judul dinamis di header
        leading: _selectedIndex == 0 // Tambahkan aksi jika halaman profil yang dipilih
            ? IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              )
            : null,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Currency Converter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'BMI Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
