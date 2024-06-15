import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvapp/constants/constant.dart';
import 'package:mvapp/services/customappbar.dart';
import 'package:mvapp/services/customcont.dart';
import 'package:http/http.dart' as http;
import 'package:mvapp/services/stackcontainer.dart';
import 'package:mvapp/widgets/categorry.dart';
import 'package:mvapp/widgets/listpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
List images=[];
late List<ListItem> lisst=[];
class _HomePageState extends State<HomePage> {
  int curindex = 0;
  final CarouselController carouselController = CarouselController();
  List<String> imagecarousellist = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeqgjN6TKBgbgKsUKl--9IOqcJFb0PKylqMDg11AdzHg&s",
    "https://www.posist.com/restaurant-times/wp-content/uploads/2019/12/MC-d-meals.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5xAJTcmgoPwftai2as4OslI1VYTjQ78LNTg&s"
  ];
  late Map<String, dynamic> result;
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchapi();
  }
  fetchapi() async {
    await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=Vegetarian"),
        headers: {
          
        }).then((value) => {
          result = jsonDecode(value.body),
          setState(() {
            images=result['meals'];
          }),
        });
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
              SizedBox(height: 10,),
              const ListTile(
                  title: Text("Special Dishes"),
                  
                ),
                SizedBox(height: 5),
                Container(
                  height: 250.h,
                  padding: EdgeInsets.all(5),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(images.length, (index)  {
                      lisst.add(ListItem(image: images[index]['strMealThumb'], title:images[index]['strMeal'], description: images[index]['idMeal']));
                      return Padding(padding: EdgeInsets.all(5),
                      child: CategoryContainer(img: images[index]['strMealThumb'], itemname:images[index]['strMeal'])
                      );
                    }),
                  ),
                ),    
                const ListTile(
                  title: Text("Delicious Cuisines"),
                ),
                SizedBox(height: 10,),
                buildCategoryList(context),
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Offers"),
                  ),
                ),
                SizedBox(height: 10,),
                CarouselSlider.builder(
                  itemCount: imagecarousellist.length,
                  itemBuilder: (context, curindex, realcurindex) {
                    final urlImage = imagecarousellist[curindex];
                    return buildImage(urlImage, curindex);
                  },
                  options: CarouselOptions(
                    height: 200,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    viewportFraction: 1,
                  ),
                ),
                SizedBox(height: 10,),
            ],
          ),
        ),
      ))
      )
    );
  }
  Widget buildImage(String urlImage, int curindex) {
    return Container(
      width: 330,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(image: NetworkImage(urlImage), fit: BoxFit.fill)),
    );
  }
}
