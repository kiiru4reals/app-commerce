import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/favs_provider.dart';
import 'package:shop/services/global_method.dart';
import 'package:shop/widget/cart_full.dart';
import 'package:shop/widget/empty_wishlist.dart';
import 'package:shop/widget/wishlist_full.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);
  static const routeName = '/WishList';

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final favsProvider = Provider.of<FavsProvider>(context);
    return favsProvider.getFavsItems.isEmpty ? Scaffold(
      body: EmptyWishlist(),

    ) : Scaffold(
      appBar: AppBar(
        title: Text('Wishlist(${favsProvider.getFavsItems.length})'),
        actions: [
          InkWell(
            onTap: () {
              globalMethods.showDialogg(
                  'Clear Wishlist?',
                  'Your wishlist will be cleared!',
                      () => favsProvider.clearFavs(),
                  context);
              // cartProvider.clearCart();
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: favsProvider.getFavsItems.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ChangeNotifierProvider.value(
              value: favsProvider.getFavsItems.values.toList()[index],
              child: WishlistFull(
                productId: favsProvider.getFavsItems.keys.toList()[index],
              ));
        }
    ),
    );
  }
}
