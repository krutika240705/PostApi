import 'package:api/api1/consr.dart';
import 'package:api/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
 List<GetUserData> userDetails=[] ;
  @override
  void initState() {
    super.initState();
	  getUserDetails();
  }

getUserDetails() async {
  try {
    List<GetUserData> userList = await getData2();
    
    if (userList.isNotEmpty) {
      for (GetUserData user in userList) {
        if (user != null) {
          userDetails.add(user);
        }
      }
    } else {
      print('No user data received.');
    }
  } catch (e) {
    print("Error: $e");
  }
  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        itemCount: userDetails.length,
        itemBuilder: 
         (context, index) {
              return Container(
                height: 280,
                color: Colors.greenAccent,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: const EdgeInsets.all(10),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "User id: ${userDetails[index].userId}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "id:${userDetails[index].id}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Title:${userDetails[index].title} ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                     "Body:  ${userDetails[index].body}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            }
      ),
    );
  }

  ///please check the model name here as we have to pass model name inside <>
 Future <List<GetUserData>> getData2() async {
    try {
      final response = await http.get(Uri.parse(appconst().url));
    
      /// below print will help us to know if data is call and set in our response variable

      print('getData2 response : ${response.body}');

      /// Added check to see if status code is 200 and set in our response model
      if(response.statusCode == 200) {
         final List<GetUserData> userDetails = (await getUserDataFromJson(response.body));

         /// as this function have a return time of FutureFuture<List<UserDetails?>> we are returing userDetails below;
      return userDetails;
      }
     
    } catch (e) {
      throw("Error $e");
    };
    return [];
  }
}