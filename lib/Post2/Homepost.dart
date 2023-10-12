import 'dart:convert';

import 'package:api/Post2/model.dart';
import 'package:api/Post2/sucessful.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.email)),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
            obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.password)),
            ),
            SizedBox(
              height: 45,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  login();
                },
                icon: Icon(Icons.login),
                label: Text("Login")),
          ],
        ),
      )),
    );
  }

  //Function to call login post api

  Future<void> login() async {
    try {
      if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {
            'email': emailController.text,
            'password': passwordController.text,
          });

      if (response.statusCode == 200) {
        final successResponse = Sucess.fromJson(json.decode(response.body));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login successful. Token: ${successResponse.token}"),
        ));
        Navigator.push(context, MaterialPageRoute(builder: (context) => Second()));
      } else {
        final errorResponse = Sucess.fromJson(json.decode(response.body));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login failed. Error: ${errorResponse.token}"),
        ));
      }
    
    }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login failed. Error: ${e}"),
        ));
    }
    
  }
}
