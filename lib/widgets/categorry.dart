import 'package:flutter/material.dart';
import 'package:mvapp/constants/categories.dart';
import 'package:mvapp/widgets/categoryitem.dart';

class CategoryRowTile extends StatelessWidget {
  const CategoryRowTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              buildCategoryRow('Category', context),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              buildCategoryList(context),
              
            ],
          ),
        ),
      ),
    );
  }
}
buildCategoryRow(String category, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        "$category",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      ElevatedButton(
        child: Text(
          "See all (9)",
          style: TextStyle(
            color: Color(0xff5563ff)
          ),
        ),
        onPressed: () {
        },
      ),
    ],
  );
}
buildCategoryList(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 6,
    child: ListView.builder(
      primary: false,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      // ignore: unnecessary_null_comparison
      itemCount: categories == null ? 0 : categories.length,
      itemBuilder: (BuildContext context, int index) {
        Map cat = categories[index];
  
        return CategoryItem(
          cat: cat,
        );
      },
    ),
  );
}