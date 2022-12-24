import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:university_bus_traking/auth/login_page.dart';
import 'package:university_bus_traking/auth/registration_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Annimation',
      theme: ThemeData(
        //primaryColor: Colors.blue,
        primarySwatch: Colors.blue
      ),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName:(_)=>const LoginPage(),
        RegistrationPage.routeName:(_)=>const RegistrationPage()
      },
    );
  }
}
