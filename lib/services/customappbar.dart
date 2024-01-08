import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvapp/constants/constant.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: width,
      color: cLightWhite,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: cSecondary,
                  backgroundImage: NetworkImage("https://picsum.photos/seed/28/600"),
                ),
                Padding(padding: EdgeInsets.only(bottom: 6.h,left: 8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery to",style: TextStyle(fontSize: 13,color: cSecondary,fontWeight: FontWeight.w600),),
                    SizedBox(
                      width: width*0.65,
                      child: Text("address address address address",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 11,color: cGrayLight,fontWeight: FontWeight.normal),),
                    )
                  ],
                ),
                )
              ],
            ),
            Text(getTimeofDay(),style: TextStyle(fontSize: 35),)
          ],
        ),
      )
    );
  }
}
String getTimeofDay(){
  DateTime now=DateTime.now();
  int hour=now.hour;
  if(hour>=0 && hour<12){
    return '☀️';
  }
  else if(hour>=12 && hour<16){
    return '☁️';
  }
  else{
    return '🌙';
  }
}