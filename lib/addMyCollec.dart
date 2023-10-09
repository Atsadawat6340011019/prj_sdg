import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
class AddMyCollec extends StatefulWidget {
  const AddMyCollec({super.key});

  @override
  State<AddMyCollec> createState() => _AddMyCollecState();
}

class _AddMyCollecState extends State<AddMyCollec> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();
  

  Future<void> add() async {
    final urlstr = 'http://172.16.201.67/greendiary/insert_diary.php';
    final url = Uri.parse(urlstr);
    final response = await http.post(
      url,
      body: {
        'title': title.text,
        'detail': detail.text,
        
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Successful
      final json = response.body;
      final data = jsonDecode(json);
      debugPrint('Data: $data');
      if (data == 'Success') {
        Navigator.pushNamed(context, '/mainuser');
        setState(() {
          //Login Completed
        });

        // ignore: use_build_context_synchronously
        // Navigator.pushNamed(context, '/home', arguments: {
        //   'user': user.text,
        // });
      }
      if (data == 'Error') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("username has already use")),
        );
      }
    }
  }

  //we can upload image from camera or from gallery based on parameter
  
  //show popup dialog
  

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
          title: Text('Add My Collection'),),
          body: Center(
            child: Form(
              key: _formKey,
              child: Center(
                    child: Column(
              children: [
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: TextFormField(
                        // The validator receives the text that the user has entered.
                        controller: title,
                        decoration: const InputDecoration(
                          labelText: 'Name of Photo',
                          hintText: 'Please input name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Name of photo';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: detail,
                        minLines: 6,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(),
                          labelText: 'Detail',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter detail';
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          add();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 142, 184, 151),
                        elevation: 0,
                      ),
                      child: Text(
                        'Add',
                        style: GoogleFonts.neuton(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
                    ),
                  ),
            ),
          ),
    );
  }
}