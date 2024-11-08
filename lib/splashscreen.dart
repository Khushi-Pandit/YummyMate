import 'package:flutter/material.dart';
import 'choose.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Color(0xFFFFD9DC),
                Color(0xFFFFE5D8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        child: Center(
          child: Text(
            "YummyMate",
            style: GoogleFonts.tangerine(
              fontWeight: FontWeight.w600,
              fontSize: 52,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
