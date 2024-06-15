

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvapp/try/listenrestaurant.dart';
import 'package:mvapp/try/listenuser.dart';

// Define enum for user types
enum UserType { user, restaurant }

Future<void> storeUserData(UserType type, dynamic data) async {
  final user = FirebaseAuth.instance.currentUser;
  final firestore = FirebaseFirestore.instance;

  if (type == UserType.user) {
    await firestore.collection('users').doc(user!.uid).set(data);
  } else {
    await firestore.collection('restaurants').add(data);
  }
}

void showConfirmationDialog(BuildContext context, dynamic data) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Select your account type'),
      content: Text('Choose the option that best describes you.'),
      actions: [
        TextButton(
          onPressed: () async {
            await storeUserData(UserType.user, data);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ListenUser()));
          },
          child: Text('User'),
        ),
        TextButton(
          onPressed: () async {
            await storeUserData(UserType.restaurant, data);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ListenRestaurant()));
          },
          child: Text('Restaurant'),
        ),
      ],
    ),
  );
}



