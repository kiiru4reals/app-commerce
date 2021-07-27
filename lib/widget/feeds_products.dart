import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class FeedsProduct extends StatefulWidget {
  const FeedsProduct({Key? key}) : super(key: key);

  @override
  _FeedsProductState createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height:290,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
        color: Theme.of(context).backgroundColor),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(2),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(minHeight: 100, maxHeight: MediaQuery.of(context).size.height*.3),
                  child: Image.network('https://images.unsplash.com/photo-1614026480209-cd9934144671?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80', fit: BoxFit.fitWidth,),

                ),),
                Positioned(
                  // bottom: 0,
                  child: Badge(
                    toAnimate: true,
                    shape: BadgeShape.square,
                    badgeColor: Colors.pink,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
                    badgeContent: Text('Fresh', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4,),
              Text("BMW M4", overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 15,
                  color: Colors.black,
              fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("KES. 123",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Quantity: 12",
                        style: TextStyle(fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
                          borderRadius: BorderRadius.circular(18),
                          child: Icon(Icons.more_horiz,
                          color: Colors.grey,),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
