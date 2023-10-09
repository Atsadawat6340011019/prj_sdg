import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  Future<void> insert() async {
    final urlstr = 'http://172.16.201.67/greendiary/insert.php';
    final url = Uri.parse(urlstr);
    final response = await http.post(
      url,
      body: {
        'username': username.text,
        'password': password.text,
        'name': name.text,
        'surname': surname.text,
        'email': email.text,
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Successful
      final json = response.body;
      final data = jsonDecode(json);
      debugPrint('Data: $data');
      if (data == 'Success') {
      Navigator.pushNamed(context, '/login');
        setState(() {
          //Login Completed
        });
        
        // ignore: use_build_context_synchronously
        // Navigator.pushNamed(context, '/home', arguments: {
        //   'user': user.text,
        // });
      } 
      if (data == 'Error'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("username has already use")),
        );
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
                'REGISTER',
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
                    labelText: 'Username',
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
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: 'name',
                    hintText: 'Please input name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
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
                  controller: surname,
                  decoration: const InputDecoration(
                    labelText: 'surname',
                    hintText: 'Please input surname',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter surname';
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
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: 'email',
                    hintText: 'Please input email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
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
                    insert();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 142, 184, 151),
                  elevation: 0,
                ),
                child: Text(
                  'REGISTER',
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