import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvapp/try/uploadimg.dart';


class ListenRestaurant extends StatefulWidget {
  const ListenRestaurant({super.key});

  @override
  State<ListenRestaurant> createState() => _ListenRestaurantState();
}

class _ListenRestaurantState extends State<ListenRestaurant> {
  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>( // Listen for restaurant updates
  stream: FirebaseFirestore.instance.collection('restaurants').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      final restaurants = snapshot.data!.docs;
      if (restaurants != null) {
        return UploadImageWidget();
      } else {
        return Text('No restaurant found');
      }
    } else {
      return CircularProgressIndicator();
    }
  },
);
  }
}