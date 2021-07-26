import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/widget/cart_full.dart';
import 'package:shop/widget/empty_cart.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List products = [];
    return !products.isEmpty? Scaffold(
      body:  EmptyCart() ,

    ): Scaffold(
      bottomSheet: checkoutSection(context),
        appBar: AppBar(
          title: Text('Cart item'),
          actions: [
            InkWell(
              onTap: (){},
              child: Icon(Ionicons.trash_bin),
            ),
          ],
        ),body: Container(
      margin: EdgeInsets.only(bottom: 60),
          child: ListView.builder(itemCount: 5,
      itemBuilder: (BuildContext ctx, int index){
            return CartFull();
      }),
        )
    );
  }
  Widget checkoutSection(BuildContext ctx){
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(
          color: Colors.grey,
          width: .5,
        ),),
      ),
      child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    colors: [
                      ColorsConsts.gradiendLStart,
                      ColorsConsts.gradiendLEnd ],
                    stops: [
                      0.0,
                      .7]

                ),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Checkout",
                      style: TextStyle(
                          color: Theme.of(ctx).textSelectionColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Text("Total: ",
            style: TextStyle(
                color: Theme.of(ctx).textSelectionColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),),
          Text("KES. 123.00",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.w500),),
        ],
        ),
      )
    );
  }
}
