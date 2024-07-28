import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn>{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isNotValid = false;

  void signIn() async{
    if(emailController.text.isNotEmpty && nameController.text.isNotEmpty) {
      var regBody = {
        "email" : emailController.text,
        "name" : nameController.text,
      };

      var response = await http.post(Uri.parse('uri'),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(regBody)
      );
    }else{
      setState(() {
        isNotValid = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC6C9),
        title: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "Sign Up",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w500,
                fontSize: 40,
                color: Colors.black,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFC6C9),
              Color(0xFFFFD7BE),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              width: 300,
              height: 45,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(7),
                      gapPadding: 12,
                    ),
                  hintText: "Name",
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 45,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border : InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(width: 1),
                      gapPadding: 12,
                    ),
                  hintText: "Number/Email",
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: (){
                  signIn();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[300],
                  elevation: 1.5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)
                  ),
                ),
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginClass(),
                    ),
                );
              },
              child: const Text(
                "Already have an account? LogIn",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}