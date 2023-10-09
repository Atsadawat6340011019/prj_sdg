import 'package:flutter/material.dart';
import 'package:prjsdg/addMyCollec.dart';
import 'package:prjsdg/collection.dart';

import 'package:prjsdg/login.dart';
import 'package:prjsdg/mainUser.dart';
import 'package:prjsdg/myCollec.dart';

import 'package:prjsdg/register.dart';
import 'package:prjsdg/selectSign.dart';
import 'package:prjsdg/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/selectsign': (context) => const SelectSign(),
        '/mainuser': (context) =>  MainUser(),
        '/register': (context) => const Register(),
        '/addmycollec': (context) => const AddMyCollec(),
        '/mycollec': (context) =>   MyCollec(),
        '/collection': (context) => Collection(),
        

        
      },
      home:  Login(),
    );
  }
}

