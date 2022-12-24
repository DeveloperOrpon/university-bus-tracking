import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  static const String routeName='/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login page'),),
      body: Center(
        child: Text('ll'),
      ),
    );
  }
}
