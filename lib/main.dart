import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'screen_1.dart';
import 'screen_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        _navigateToAuth();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed('/screen1');
  }

  void _navigateToAuth() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
