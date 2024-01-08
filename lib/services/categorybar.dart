import 'package:flutter/material.dart';
import 'package:mvapp/constants/constant.dart';

class CategoryDart extends StatelessWidget {
   CategoryDart({super.key,required this.url});
  String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 2,
          offset: Offset(1, 1),
        ),
        BoxShadow(
          color: cLightWhite,
        )
      ]),
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          child: Image.network(
            url,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}