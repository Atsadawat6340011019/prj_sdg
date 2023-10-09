import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SelectSign extends StatefulWidget {
  const SelectSign({super.key});

  @override
  State<SelectSign> createState() => _SelectSignState();
}

class _SelectSignState extends State<SelectSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
      Align(
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/image/grass.png',
              width: 300,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Flexible(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
          child: Text(
            'Welcome To \n Green Diary',
            textAlign: TextAlign.center,
            style: GoogleFonts.neuton(
                  color: Color(0xFF5B7553),
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
        child: SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/login');
            }, 
            child: Text('LOGIN',
            style: GoogleFonts.neuton(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 142, 184, 151),
              elevation: 0,
            ),),
        )
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/register');
            }, 
            child: Text('REGISTER',
            style: GoogleFonts.neuton(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 142, 184, 151),
                    elevation: 0,
                  ),
            ),
        )
      ),
      ],
    ),
    );

  }
}