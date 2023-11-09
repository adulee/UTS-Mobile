import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart'; // Sesuaikan dengan path file login.dart

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3), // Misalnya durasi 3 detik
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()), // Pindahkan ke halaman login
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            // Tambahkan elemen-elemen Splash Screen di sini
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Selamat Datang'),
          ],
        ),
      ),
    );
  }
}