import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainUser extends StatefulWidget {
  const MainUser({
    super.key,
  });

  @override
  State<MainUser> createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 142, 184, 151),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        centerTitle: true,
        title: Text('Green Diary'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/image/main.png'),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'Diary for your environmental',
                style: GoogleFonts.neuton(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B7553),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/addmycollec');
                  },
                  label: Text(
                    "Add My Collections",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5B7553),
                    fixedSize: const Size(208, 43),
                  ),
                )),
                SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/collection');
                  },
                  label: Text(
                    "My Collections",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5B7553),
                    fixedSize: const Size(208, 43),
                  ),
                )),
            
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
