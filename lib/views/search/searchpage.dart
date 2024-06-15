import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvapp/maps/apifetch.dart';
import 'package:mvapp/maps/geolocator.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
   var client = WeatherData();
  var data;

  info() async {
    var position = await GetPosition();
    data = await client.getdata(position.latitude, position.longitude);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder(
            future: info(),
            builder: (context, snapshot) {
              return SafeArea(
                  child: Container(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .70,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 25),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.teal,
                              Colors.white,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Text(
                            "${data?.cityname}",
                            style: GoogleFonts.aboreto(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${data?.time}",
                            style: GoogleFonts.aboreto(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.25,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            ),
                            child: Center(child: Text("MAPS",style: TextStyle(fontSize: 25),),),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Weather",
                            style: GoogleFonts.candal(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "${data?.temp}" + "°",
                            style: GoogleFonts.candal(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text("${data?.region}"),
                          Text("${data?.country}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
            })
     
    );
  }
}