import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop/widget/cart_full.dart';
import 'package:shop/widget/empty_wishlist.dart';
import 'package:shop/widget/wishlist_full.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);
  static const routeName = '/WishList';

  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return !wishlistList.isEmpty ? Scaffold(
      body: EmptyWishlist(),

    ) : Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext ctx, int index) {
          return WishlistFull();
        }
    ),
    );
  }
}
