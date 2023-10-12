import 'dart:convert';

import 'package:api/api1/model1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  List<Employesinfo> employesinfo = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                itemCount: employesinfo.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    margin: EdgeInsets.only(bottom: 10),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gettext(
                              index, 'ID:', employesinfo[index].id.toString()),
                          gettext(index, 'Name:',
                              employesinfo[index].name.toString()),
                          gettext(index, 'Email:',
                              employesinfo[index].email.toString()),
                          gettext(index, 'Phone:',
                              employesinfo[index].phone.toString()),
                          gettext(index, 'Website:',
                              employesinfo[index].website.toString()),
                          gettext(index, 'Company Name:',
                              employesinfo[index].company.name.toString()),
                          gettext(index, 'Address:',
                              '${employesinfo[index].address.suite.toString()},${employesinfo[index].address.street.toString()},${employesinfo[index].address.city.toString()} - ${employesinfo[index].address.zipcode.toString()}'),
                        ]),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Text gettext(int index, String fieldName, String content) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: fieldName,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      TextSpan(text: content, style: TextStyle(fontSize: 16)),
    ]));
  }

  Future<List<Employesinfo>> getData() async {
    final re =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(re.body.toString());
    if (re.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        employesinfo.add(Employesinfo.fromJson(index));
      }
      return employesinfo;
    } else {
      return employesinfo;
    }
  }
}
