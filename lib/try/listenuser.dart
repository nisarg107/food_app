import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvapp/try/listenrestaurant.dart';
import 'package:mvapp/try/userprofile.dart';

class ListenUser extends StatefulWidget {
  const ListenUser({super.key});

  @override
  State<ListenUser> createState() => _ListenUserState();
}

class _ListenUserState extends State<ListenUser> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>( // Listen for user changes
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      final user = snapshot.data!;
      return FutureBuilder<DocumentSnapshot>( // Fetch user data
        future: FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Show user profile page
            return UserProfilePage();
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } else {
      return const ListenRestaurant();
    }
  },
);
  }
}