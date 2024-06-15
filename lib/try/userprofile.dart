import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvapp/auth/authservice.dart';

class UserProfilePage extends StatelessWidget {
  final auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Profile picture
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage("https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600",)// Replace with your image
                  ),
                  SizedBox(height: 20.0),
            
                  // Username
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  FutureBuilder(
                    future: auth.getCurrentUsername(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return buildUserInfoDisplay("Name", "${snapshot.data}");
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
            
                  // Email
                  FutureBuilder(
                future: auth.getCurrentEmail(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return buildUserInfoDisplay("E-mail", "${snapshot.data}");
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),
                   FutureBuilder(
                    future: auth.getCreatedDate(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return buildUserInfoDisplay(
                            "Created", "${snapshot.data}");
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  SizedBox(height: 5,),
                  OutlinedButton(
                    onPressed: () {
                      // Navigate to edit profile screen
                    },
                    child: Text('Edit Profile'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.redAccent,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        final _auth = FirebaseAuth.instance;
                        await _auth.signOut();
                        Navigator.of(context).pushNamed('/');
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'SIGN OUT',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildUserInfoDisplay(String title, String data) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Center(
                child: Text(
                  data,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ))
        ],
      ));
}
