import 'package:flutter/material.dart';
import 'login_service.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  void showInvalidCredentialsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terjadi Kesalahan'),
          content: const Text('Username atau password anda salah'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () async {
              String username = 'user'; // Ganti dengan nilai username yang diinginkan
              String password = 'pass'; // Ganti dengan nilai password yang diinginkan
              bool loginSuccess = await LoginService().loginUser(username, password);
              if (loginSuccess) {
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
              } else {
                showInvalidCredentialsDialog(context);
              }
            },
            child: const Text('Log In'),
          ),
        ],
      ),
    );
  }
}