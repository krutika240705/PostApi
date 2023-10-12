import 'package:api/api1/consr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              "Login Page",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              "Email Id",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 320,
            height: 50,
            margin: const EdgeInsets.only(
              left: 40,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(231, 231, 231, 1),
              ),
            ),
            child:  TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email id',
                hintStyle: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(157, 157, 172, 1)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              "Password ",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 320,
            height: 50,
            margin: const EdgeInsets.only(
              left: 40,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(231, 231, 231, 1),
              ),
            ),
            child:  TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(157, 157, 172, 1)),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                 postdata(email: emailController.text,password: passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(163, 201, 101, 1),
                  // Background color
                  onPrimary: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Border radius
                  ),
                  padding: const EdgeInsets.all(0), // Button padding
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold), // Text style
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
   Future <void> postdata({String? email, String? password}) async {
    try {
      final response = await http.post(Uri.parse(appconst().Login),body: {
        "email": email,
        "Password": password,
      });
    
      /// below print will help us to know if data is call and set in our response variable

      print('getData2 response : ${response.body}');
print("Successfully login");
      /// Added check to see if status code is 200 and set in our response model
      if(response.statusCode == 200) {
        // final List<GetUserData> userDetails = (await getUserDataFromJson(response.body));

         /// as this function have a return time of FutureFuture<List<UserDetails?>> we are returing userDetails below;
      //return userDetails;
      }
     
    } catch (e) {
      throw("Error $e");
    };
    
  }
}
