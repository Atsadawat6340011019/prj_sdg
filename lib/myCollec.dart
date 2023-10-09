import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class MyCollec extends StatefulWidget {
  const MyCollec({super.key});

  @override
  State<MyCollec> createState() => _MyCollecState();
}

class _MyCollecState extends State<MyCollec> {
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
          )),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'My Collections',
                  style: GoogleFonts.neuton(
                    color: Color(0xFF5B7553),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                //replace with our own icon data.
              ),
            ],
          ),
          ListView.builder(
            itemCount: collec.length,
            itemBuilder: (context, index) {
              final title = collec[index]['title'];
              final detail = collec[index]['detail'];
              return ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/image/main.png'),
                ),
                title: Text(
                  title,
                  style: GoogleFonts.neuton(
                    fontSize: 24,
                    color: Color(0xFF5B7553),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  detail,
                  style: GoogleFonts.neuton(
                    fontSize: 18,
                    color: Color(0xFF5B7553),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                  //replace with our own icon data.
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
