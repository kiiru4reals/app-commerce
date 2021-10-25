import 'package:badges/badges.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/const/my_icons.dart';
import 'package:shop/models/product.dart';
import 'package:shop/provider/cart_provider.dart';
import 'package:shop/provider/favs_provider.dart';
import 'package:shop/provider/products.dart';
import 'package:shop/ui/cart.dart';
import 'package:shop/ui/wishlist.dart';
import 'package:shop/widget/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feeds extends StatelessWidget {

  static const routeName = '/Feed';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final cartProvider= Provider.of<CartProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);
    List<Product> productsList= productsProvider.products ;
    return Scaffold(
      appBar: AppBar(
        title: Text("All products"),
        actions: [
          Consumer<FavsProvider>(
            builder: (_, favs, ch)=> Badge(
              badgeColor: ColorsConsts.cartBadgeColor,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              position: BadgePosition.topEnd(top: 5, end: 7),
              badgeContent: Text(favsProvider.getFavsItems.length.toString(),
                style: TextStyle(
                    color: Colors.white
                ),),

              child: IconButton(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: ColorsConsts.favColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(WishList.routeName);
                },
              ),
            ),
          ),
          Consumer<CartProvider>(
            builder: (_, cart, ch)=> Badge(
              badgeColor: ColorsConsts.cartBadgeColor,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              position: BadgePosition.topEnd(top: 5, end: 7),
              badgeContent: Text(cartProvider.getCartItems.length.toString(),
                style: TextStyle(
                    color: Colors.white
                ),),

              child: IconButton(
                icon:                   IconButton(
                  icon: Icon(
                    MyAppIcons.cart,
                    color: ColorsConsts.cartColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ShoppingCart.routeName);
                  },
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(WishList.routeName);
                },
              ),
            ),
          ),

        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 420,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(productsList.length, (index) {
          return ChangeNotifierProvider.value(
            value: productsList[index],
            child: FeedProducts(
            ),
          );
        }),
      ),
//         StaggeredGridView.countBuilder(
//           padding: ,
//   crossAxisCount: 6,
//   itemCount: 8,
//   itemBuilder: (BuildContext context, int index) =>FeedProducts(),
//   staggeredTileBuilder: (int index) =>
//       new StaggeredTile.count(3, index.isEven ? 4 : 5),
//   mainAxisSpacing: 8.0,
//   crossAxisSpacing: 6.0,
// ),
    );
  }
}
