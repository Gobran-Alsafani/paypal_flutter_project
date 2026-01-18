import 'package:flutter/material.dart';

String s = "";
Color cs=Colors.black;

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: cs,
        title: Text(s),
        centerTitle: true,
      ),
      backgroundColor: cs,
    );
  }
}