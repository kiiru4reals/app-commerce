import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) ,bottomRight: Radius.circular(10),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){},
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(
                            'https://images.unsplash.com/photo-1614026480209-cd9934144671?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80'),
                        fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(right: 12,
                  top: 10,
                  child: Icon(Ionicons.star_sharp,
                    color: Colors.grey.shade800,),
                  ),
                  Positioned(right: 10,
                    top: 7,
                    child: Icon(Ionicons.star_sharp,
                      color: Colors.white,),
                  ),
                  Positioned(right: 12,
                    bottom: 32.0,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Theme.of(context).backgroundColor,
                      child: Text("KES. 123",
                      style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                      ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Description',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800
                        ),),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
                          borderRadius: BorderRadius.circular(30.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.add_shopping_cart_sharp,
                            size: 25,
                            color: Colors.black,),
                          ),
                        ),
                      )
                    ],)
                  ],
                ),
              )
            ],),
          ),
        ),
      ),
    );
  }
}
