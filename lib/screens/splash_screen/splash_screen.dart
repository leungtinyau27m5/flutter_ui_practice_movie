import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/screens/home_screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.black,
        // image: DecorationImage(
        //   image: NetworkImage("https://placeholder.com/1500"),
        //   fit: BoxFit.cover,
        //   opacity: 0.5,
        // ),
      ),
      child: Center(
        child: Text(
          "Movies",
          style: GoogleFonts.lobster(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
