import 'package:flutter/material.dart';
import 'main.dart'; // Sesuaikan dengan path file MyHomePage
import 'login_service.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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

  void showLoginErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Username or password is incorrect'),
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
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () async {
              String username = usernameController.text;
              String password = passwordController.text;
              if (username.isEmpty || password.isEmpty) {
                showLoginErrorDialog(context);
              } else {
                bool loginSuccess = await LoginService().loginUser(username, password);
                if (loginSuccess) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                } else {
                  showLoginErrorDialog(context);
                }
              }
            },
            child: const Text('Log In'),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}