import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  int check = 0;


  Future<void> checkLogin() async {
    final urlstr = 'http://172.16.201.67/greendiary/checklogin.php';
    final url = Uri.parse(urlstr);
    final response = await http.post(
      url,
      body: {
        'username': username.text,
        'password': password.text,
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Successful
      final json = response.body;
      final data = jsonDecode(json);
      debugPrint('Data: $data');
      if (data == 'Completed') {
      Navigator.pushNamed(context, '/mainuser');
        setState(() {
          check = 1; //Login Completed
        });
        
        // ignore: use_build_context_synchronously
        // Navigator.pushNamed(context, '/home', arguments: {
        //   'user': user.text,
        // });
      } else {
        Fluttertoast.showToast(
            msg: "Please check username or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 255, 0, 0),
            textColor: Colors.white,
            fontSize: 16.0);
      
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 142, 184, 151), 
          leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/selectsign');
        },
        icon: Icon(Icons.arrow_back_ios),
        //replace with our own icon data.
      )),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text(
                'LOGIN',
                textAlign: TextAlign.center,
                style: GoogleFonts.neuton(
                  color: Color(0xFF5B7553),
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                  height: 0.03,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  controller: username,
                  decoration: const InputDecoration(
                    labelText: 'username',
                    hintText: 'Please input username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  controller: password,
                  decoration: const InputDecoration(
                    labelText: 'password',
                    hintText: 'Please input password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    checkLogin();
                    
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 142, 184, 151),
                  elevation: 0,
                ),
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.neuton(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
