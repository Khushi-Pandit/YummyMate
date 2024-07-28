import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign.dart';
class LoginClass extends StatefulWidget {
  const LoginClass({super.key});

  @override
  State<LoginClass> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {
  TextEditingController emailController = TextEditingController();

  void loginUser()async{
    if(emailController.text.isNotEmpty ){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC6C9),
        title: Text(
            "Login",
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w500,
              fontSize: 40,
              color: Colors.black,
            ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                controller: emailController,
                decoration: InputDecoration(
                  border : InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(width: 1),
                      gapPadding: 12,
                    ),
                  hintText: "Number/Email",
                  helperStyle: TextStyle(color: Colors.grey[500]),
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
                    loginUser();
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[300],
                  elevation: 1.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                  child: const Text(
                    "LogIn",
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
                  MaterialPageRoute(builder: (context) => const SignIn(),
                  ),
                );
              },
              child: const Text(
                "Create new Account? SignUp",
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