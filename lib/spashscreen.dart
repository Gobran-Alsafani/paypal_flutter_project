import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paypal_application/auth/login.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002992),
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/p.png"),
            fit: BoxFit.contain,
          ),
        ),
      )),
    );
  }
}
