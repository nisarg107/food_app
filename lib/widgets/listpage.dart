import 'package:flutter/material.dart';
import 'package:mvapp/widgets/fooddesc.dart';

class DecorativePagee extends StatelessWidget {
  final List<ListItem> listItems;

  const DecorativePagee({Key? key, required this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with semi-transparent overlay
          _buildBackgroundImage(),

          // Content area with list
          SingleChildScrollView(
            child: _buildContentArea(context),
          )
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1620706857370-e1b9770e8bb1?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.multiply,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildContentArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          final item = listItems[index];
          return _buildListItem(item,context);
        },
      ),
    );
  }

  Widget _buildListItem(ListItem item,BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>FoodDesc(name: item.title, img: item.image,id: item.description,),barrierDismissible: true),);
      },
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          height: MediaQuery.of(context).size.height*0.15,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: MediaQuery.of(context).size.width*0.2,
                  width: MediaQuery.of(context).size.width*0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(item.image),fit: BoxFit.cover)
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Container(
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width*0.48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(padding: EdgeInsets.only(top: 5,right: 5),child: Text(item.title),)
              ),
              SizedBox(width: 10,),
              Container(
                 height: MediaQuery.of(context).size.width * 0.2,
                 width: MediaQuery.of(context).size.width*0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 77, 211, 82)
                ),
                child: Center(child: Text(">",style: TextStyle(color: Colors.white),),),
              )
            ],
          ),
        )
      ),
    );
  }
}

// ListItem model
class ListItem {
  final String image;
  final String title;
  final String description;

  ListItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
