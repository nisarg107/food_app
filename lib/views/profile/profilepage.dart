import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvapp/services/mapDetails.dart';
import 'package:mvapp/try/service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
Map<String, dynamic> userData = {
  'name': 'John Doe',
  'email': 'johndoe@example.com',
};
Map<String, dynamic> restaurantData = {
  'ownerId': '123452',
  'name': 'My Restaurant',
  'cuisine': 'Italian',
};

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;
  @override
  Info func() {
    final String currentUserid = _auth.currentUser!.uid;
    final String currentUseremail = _auth.currentUser!.email.toString();
    Info info = Info(uid: currentUserid, useremail: currentUseremail);
    return info;
  }
  Widget build(BuildContext context) {
    logOut() async {
      final _auth = FirebaseAuth.instance;
      await _auth.signOut();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Logged in"),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _auth.signOut();
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showConfirmationDialog(
                  context, func().toMap()); // or restaurantData
            },
            child: Text('Submit Data'),
          ),
        ),
      ),
    );
 
  }
  Widget _buildUserlist() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Errorr");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserlistItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildUserlistItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
          title: Text(
            data['email'],
          ),
          onTap: () {});
    } else {
      return Container();
    }
  }
}
