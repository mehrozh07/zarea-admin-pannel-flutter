import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zarea_admin/screens/login.dart';
import 'package:zarea_admin/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'Splash-Screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if(user == null){
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        }else{
          Navigator.pushReplacementNamed(context, HomeScreen.id);
          //first go to Landing than will decide where to go

        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
