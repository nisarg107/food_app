import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mvapp/models/cartpage.dart';
import 'package:mvapp/models/fooditem.dart';
import 'package:mvapp/models/foodprovider.dart';
import 'package:mvapp/models/mealnotifier.dart';
import 'package:provider/provider.dart';

class FoodDesc extends StatefulWidget {
  final String name;
  final String img;
  final String id;
   FoodDesc({super.key,required this.name,required this.img,required this.id});
  @override
  State<FoodDesc> createState() => _FoodDescState();
}
class _FoodDescState extends State<FoodDesc> {
  int a=0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    a=0;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                       automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.menu_open_rounded,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      floating: true,
                      snap: false,
                      expandedHeight: MediaQuery.of(context).size.height,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                               height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height*0.4,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey.shade300,
                                child: Image.network(widget.img,fit: BoxFit.fill,),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height*0.07,
                                right: 16,
                                child: Icon(Icons.favorite_border_outlined)),  
                            ],
                          )
                            ),
                            Positioned(
                    bottom: 30,
                    child: SingleChildScrollView(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.645,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name,
                                  style:const TextStyle(
                                    color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                  )
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    RatingBar.builder(
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemCount: 5,
                                        itemSize: 22,
                                        itemBuilder: ((contex, _) => const Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.black,
                                            )),
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        onRatingUpdate: (rating) {})
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    widget.name,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child:Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a fermentum mi, vel consequat tortor. Fusce at massa quis lectus porttitor gravida. Nunc porttitor aliquet urna, ac vulputate justo dapibus et. Sed eu consequat massa, sed sollicitudin erat. Pellentesque sed venenatis urna. Pellentesque efficitur blandit maximus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ullamcorper dignissim sapien, sit amet cursus nisi cursus sed. Maecenas porttitor rhoncus vulputate. Donec scelerisque faucibus blandit. Sed rutrum condimentum suscipit. Aliquam erat volutpat. Suspendisse et mi tempor, euismod dolor sed, iaculis mi. Vestibulum elit lectus, viverra et augue a, interdum facilisis purus."),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.14,
                        width: MediaQuery.of(context).size.width,
                        decoration:  BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20,top: 20),
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.07,
                                width: MediaQuery.of(context).size.height * 0.15,
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                               color: Colors.white
                               ),
                               child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap:() {
                                      Provider.of<MealNotifier>(context,listen: false).decrementX();
                                    },
                                    child:const Text("-",
                                      style: TextStyle(color: Colors.black,fontSize: 20)),
                                  ),
                                  Consumer<MealNotifier>(
                                    builder: (context, valueX, child) {
                                      
                                      return Text(valueX.x.toString(),
                                      style: TextStyle(color: Colors.black, fontSize: 20),);
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<MealNotifier>(context,listen: false).incrementX();
                                    },
                                    child: Text("+",style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                    ),),
                                  )
                                ],
                               ),
                              ),
                              ),
                              Padding(
                          padding: const EdgeInsets.only(right: 20, top: 20),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                            },
                            child: GestureDetector(
                              onTap: (){
                                 final cartProvider = Provider.of<CartProvider>(
                                    context,
                                    listen: false);

                                final String itemName = widget
                                    .name; // Replace with actual item name
                                final double itemPrice = 10;
                                final int quantity=a;

                                final foodItem =
                                    FoodItem(itemName, itemPrice, quantity);

                                // Add the item to the cart
                                cartProvider.addToCart(foodItem);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green),
                                child: Center(
                                  child:  Consumer<MealNotifier>(
                                    builder: (context, valueX, child) {
                                          a=valueX.x;
                                         int h = valueX.x * 10;
                    
                                      return Text("\$ ${h.toString()} | Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16));
                                    },
                                    
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                            ],
                          ),
                      ),
                      
                    )
                          ],
                        ),
                      ),
                    )
                  ],
                )
    ),
    ); }
}