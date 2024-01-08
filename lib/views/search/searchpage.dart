import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: cPrimary,
        child: Center(
          child: Text("Search"),
        ),
      ),
    );
  }
}