import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:prjsdg/editMyCollec.dart';
import 'package:prjsdg/mainUser.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  List<dynamic> collec = [];

  @override
  void initState() {
    getCollec();
    super.initState();
  }

  Future<void> getCollec() async {
    const urlstr = "http://172.16.201.67/greendiary/select_user.php";

    final url = Uri.parse(urlstr);
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Successful
      final json = response.body;
      final data = jsonDecode(json);
      debugPrint('Data: $data');
      setState(() {
        collec = data;
      });
    } else {
      //Error
    }
  }

  Future delUser(title) async {
    // var url = 'https://pattyteacher.000webhostapp.com/edit.php';
    var url = Uri.parse('http://172.16.201.67/greendiary/delete.php');
    var data = {};

    data['title'] = title;
    debugPrint('Delete: $title');
    var response = await http.post(
      url,
      body: data,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      debugPrint('Print Result: $result');
      if (result == "Success") {
        debugPrint('Delete Success');
        getCollec();
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => const MainUser(),
           ),
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
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            //replace with our own icon data.
          ),
          title: Text('My Collection'),
          centerTitle: true,),
      body: ListView.builder(
        itemCount: collec.length,
        itemBuilder: (context, index) {
          final title = collec[index]['title'];
          final detail = collec[index]['detail'];
          return ListTile(
            leading: Image.asset('assets/image/main.png'),
            title: Text(title),
            subtitle: Text(detail),
            trailing: IconButton(
            onPressed: () {
              delUser(title);
            },
            icon: Icon(Icons.delete),
            //replace with our own icon data.
          ),
          );
        }
      ),
    );
  }
}