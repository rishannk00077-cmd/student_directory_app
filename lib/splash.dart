import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_directory_app/std_directory.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3,),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StdDirectory(),));
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset("assets/campus.json")
      ),
    );
  }
}