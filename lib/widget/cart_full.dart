import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/models/cart_attr.dart';
import 'package:shop/provider/cart_provider.dart';
import 'package:shop/provider/dark_theme_provider.dart';
import 'package:shop/routes/product_details.dart';
import 'package:shop/services/global_method.dart';

class CartFull extends StatefulWidget {
  final String productId;

  const CartFull({required this.productId});

  /*final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;

  const CartFull(
      {
      required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title,
      required this.imageUrl});*/

  // const CartFull({Key? key}) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();

}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final cartAttr = Provider.of<CartAttr>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double subTotal = cartAttr.price * cartAttr.quantity;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
          arguments: widget.productId),
      child: Container(
        height: 135,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(16),
            topRight: const Radius.circular(16),
          ),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(cartAttr.imageUrl), fit: BoxFit.fill),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            cartAttr.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              globalMethods.showDialogg('Remove Item?', 'Product will be removed from the cart!', ()=> cartProvider.removeItem(widget.productId), context);
                              // cartProvider.removeItem(widget.productId);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Price:"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'KES. ${cartAttr.price}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        FittedBox(child: Text("Sub-total:")),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'KES. ${subTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: themeChange.darkTheme
                                  ? Colors.brown.shade900
                                  : Theme.of(context).colorScheme.secondary),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Delivery fee",
                          style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.brown.shade900
                                  : Theme.of(context).colorScheme.secondary),
                        ),
                        Spacer(),
                        Material(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: cartAttr.quantity < 2
                                ? null
                                : () {
                                    cartProvider.reduceItemByOne(
                                        widget.productId,
                                        );
                                  },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.remove,
                                  color: cartAttr.quantity < 2
                                      ? Colors.grey: Colors.red,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .12,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                ColorsConsts.gradiendLStart,
                                ColorsConsts.gradiendLEnd
                              ], stops: [
                                0.0,
                                .7
                              ]),
                            ),
                            child: Text(
                              cartAttr.quantity.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              cartProvider.addProductToCart(
                                  widget.productId,
                                  cartAttr.price,
                                  cartAttr.title,
                                  cartAttr.imageUrl);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
