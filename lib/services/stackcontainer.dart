import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryContainer extends StatelessWidget {
   CategoryContainer({super.key,required this.img,required this.itemname});
  String itemname;
  String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: Offset(1, 1),
        ),
        BoxShadow(
          color: const Color.fromARGB(255, 255, 255, 255),
        )
      ]),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:
                    DecorationImage(image: NetworkImage(img), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemname,
                style: GoogleFonts.waitingForTheSunrise(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            
            ],
          )
        ],
      ),
    );
    ;
  }
}