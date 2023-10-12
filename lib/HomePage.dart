// import 'dart:convert';


// import 'package:api/api1/consr.dart';
// import 'package:api/model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   List<UserDetails> userdetails =[];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//             itemCount: userdetails.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 height: 280,
//                 color: Colors.greenAccent,
//                 padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 margin: const EdgeInsets.all(10),
//                 child:  Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "User id: ${userdetails[index].userId}",
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     Text(
//                       "id: ${userdetails[index].id}",
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     Text(
//                       "Title: ${userdetails[index].title}",
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     Text(
//                       "Body: ${userdetails[index].body}",
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }
//             ),
//     );
//   }

//   Future<List<UserDetails?>> getData(String url) async {
//     try {
//       final response =
//         await http.get(Uri.parse(url));
//  var data =jsonDecode(response.body.toString());
//  if (response.statusCode ==200) {
//   userdetails.add(UserDetails.fromJson(data));
//    return userdetails;
//  }else{
//   return userdetails;
//  }
//     } catch (e) {
//       debugPrint("Eroor${e}");
//     }
//     return userdetails;
    
//   }
// }
