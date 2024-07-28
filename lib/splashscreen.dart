import 'package:flutter/material.dart';
import 'choose.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), (){
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ChoiceClass(),
      ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFC6C9),
                Color(0xFFFFD7BE),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        child: const Center(
          child: Text(
            "YummyMate",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 35,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
