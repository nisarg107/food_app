import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvapp/constants/constant.dart';
import 'package:mvapp/services/categorybar.dart';
import 'package:mvapp/services/customappbar.dart';
import 'package:mvapp/services/customcont.dart';
import 'package:http/http.dart' as http;
import 'package:mvapp/services/stackcontainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images=[];
  late Map<String, dynamic> result;
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchapi();
  }
  fetchapi() async {
    await http.get(Uri.parse("https://api.spoonacular.com/recipes/complexSearch?apiKey=6abaa5b051cc4510a6b0731977a7b4e3"),
        headers: {
          'Authorization':
              '6abaa5b051cc4510a6b0731977a7b4e3'
        }).then((value) => {
          result = jsonDecode(value.body),
          setState(() {
            images=result['results'];
          }),
        });
    print(result['results']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: PreferredSize(preferredSize: Size.fromHeight(100.h), child: CustomAppbar()),
      body: SafeArea(child: CustomContainer(containerContent: Container(
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryDart(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo--yLER2XjTJXrOWs2amN_hzFUn4t8Nx8AEMKE88fSg&s"),
                  CategoryDart(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo--yLER2XjTJXrOWs2amN_hzFUn4t8Nx8AEMKE88fSg&s"),
                  CategoryDart(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo--yLER2XjTJXrOWs2amN_hzFUn4t8Nx8AEMKE88fSg&s"),
                ],
              ),
              SizedBox(height: 10,),
              const ListTile(title: Text("Nearby Restaurants"),
              trailing: Icon(Icons.more_horiz_sharp,size: 20,),
              ),
              const ListTile(
                  title: Text("Nearby Restaurants"),
                  trailing: Icon(          
                    Icons.more_horiz_sharp,
                    size: 20,
                  ),     
                ),
                SizedBox(height: 10,),

                Container(
                  height: 250.h,
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(images.length, (index)  {
                      return Padding(padding: EdgeInsets.all(10),
                      child: CategoryContainer(img: images[index]['image'], itemname:images[index]['title'])
                      );
                    }),
                  ),
                ),
                const ListTile(
                  title: Text("Nearby Restaurants"),
                  trailing: Icon(
                    Icons.more_horiz_sharp,
                    size: 20,
                  ),
                )
            ],
          ),
        ),
      ))
      )
    );
  }
}