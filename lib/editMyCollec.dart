import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:prjsdg/collection.dart';


class EditMyCollec extends StatefulWidget {
  final List list;
  final int index;
  const EditMyCollec({super.key , required this.list, required this.index});

  @override
  State<EditMyCollec> createState() => _EditMyCollecState();
}

class _EditMyCollecState extends State<EditMyCollec> {
  TextEditingController title = new TextEditingController();
  TextEditingController detail = new TextEditingController();
 
  bool editMode = false;

 Future editDiary() async {
    if (editMode) {
      // var url = 'https://pattyteacher.000webhostapp.com/edit.php';
      var urlstr = "http://172.16.201.67/greendiary/edit.php";
      var url = Uri.parse(urlstr);
      await http.post(url, body: {
        //'id' : widget.list[widget.index]['id'],
        'title': title.text,
        'detail': detail.text,
        
      });
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Collection(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    editMode = true;
    title.text = widget.list[widget.index]['title'];
    detail.text = widget.list[widget.index]['detail'];
    
  }

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
        title: Text('Edit My Collections'),),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset(
                'assets/image/welcome.png',
                width: 250,
              ),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    child: TextFormField(
                      // The validator receives the text that the user has entered.
                      controller: title,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        hintText: 'Input Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
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
                        labelText: 'Enter Details',
                      ),
                    ),
                  ),
                  ElevatedButton(
                  onPressed: () {
                    setState(() {
                      editDiary();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 142, 184, 151),
                    elevation: 0,
                  ),
                  child: Text(
                    'Edit',
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
      
    );
  }
}