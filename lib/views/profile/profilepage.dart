import 'package:flutter/material.dart';
import 'package:mvapp/constants/constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: cPrimary,
        child: Center(
          child: Text("Profile"),
        ),
      ),
    );
  
  }
}