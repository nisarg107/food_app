import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvapp/services/stackcontainer.dart';
import 'package:mvapp/widgets/listpage.dart';
import 'package:http/http.dart' as http;
class CategoryTilePage extends StatefulWidget {
  final String name;
  const CategoryTilePage({super.key,required this.name});

  @override
  State<CategoryTilePage> createState() => _CategoryTilePageState();
}
List images = [];
List<ListItem> listt = [];
class _CategoryTilePageState extends State<CategoryTilePage> {
  late Map<String, dynamic> result;
  @override
   void initState() {
    // TODO: implement initState
    super.initState();
    fetchapi();
    print("init");
  }
  fetchapi() async {
    await http
        .get(Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.name}"), headers: {}).then(
            (value) => {
                  result = jsonDecode(value.body),
                  setState(() {
                    images = result['meals'];
                  }),
                });
                generate();
  }
  generate() async{
    buildSome(context);
  }
  @override
  void dispose() {
    // TODO: implement dispose 
    super.dispose();
    listt.clear();
    print("dispose");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: DecorativePagee(listItems: listt),
                )
    )
    );
  }
}
Widget buildSome(BuildContext context){
  return Container(
                  height: 250.h,
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(images.length, (index)  {
                      listt.add(ListItem(image: images[index]['strMealThumb'], title:images[index]['strMeal'], description: images[index]['idMeal']));
                      return Padding(padding: EdgeInsets.all(10),
                      child: CategoryContainer(img: images[index]['strMealThumb'], itemname:images[index]['strMeal'])
                      );
                    }),
                  ),
                );
}

 