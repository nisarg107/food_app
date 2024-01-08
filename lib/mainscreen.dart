import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mvapp/constants/constant.dart';
import 'package:mvapp/services/bottombar.dart';
import 'package:mvapp/services/pagenotifier.dart';
import 'package:mvapp/views/home/homepage.dart';
import 'package:mvapp/views/profile/profilepage.dart';
import 'package:mvapp/views/search/searchpage.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
List<Widget> pagelist = [
  HomePage(),
  SearchPage(),
  ProfilePage(),
];
class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
     int page_index=4;
    return Consumer<PageNotifier>(builder:(context,value,child){
      return Scaffold(
        backgroundColor: cPrimarylight,
        body: pagelist[value.activepage],
        bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          color: cPrimarylight,
          animationDuration: Duration(milliseconds: 500),
          buttonBackgroundColor: Color(0xffdddddd),
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              value.activePage=index;
            });
          },
          items: [
          Icon(value.activepage == 0 ? Icons.home : Icons.home_filled),
          Icon(value.activepage == 1 ? Icons.search : Icons.search_off),
          Icon(value.activepage == 2 ? Icons.add : Icons.add_box),
        ])
      );
    });
  }
}