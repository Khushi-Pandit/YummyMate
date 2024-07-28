import 'package:flutter/material.dart';
import 'login.dart';
import 'sign.dart';

class ChoiceClass extends StatefulWidget{
  const ChoiceClass ({super.key});

  @override
  State<ChoiceClass> createState(){
    return _ChoiceClassState();
  }
}

class _ChoiceClassState extends State<ChoiceClass>{
  final asCaterer = false;
  final asUser = false;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/choose_gif.gif',
                    fit: BoxFit.contain,
                    width: 350,
                    height: 300,
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
            ),
          SizedBox(
            width: 320,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                elevation: 1.5,
                backgroundColor: Colors.red[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: (){
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => const LoginClass(),
                  ),
                );
              },
              child: const Center(
                child: Text(
                  "LogIn",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            width: 320,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                elevation: 1.5,
                backgroundColor: Colors.red[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn(),
                    ),
                );
              },
              child: const Center(
                child: Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
