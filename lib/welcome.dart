import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjsdg/register.dart';
import 'package:prjsdg/selectSign.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectSign(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/image/welcome.png',
                width: 300,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
          child: Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: GoogleFonts.neuton(
              color: Color(0xFF5B7553),
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ));
  }
}
