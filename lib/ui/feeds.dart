import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop/widget/feeds_products.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);
  static const routeName = '/Feed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Our latest products"),
        centerTitle: true
      ),
      body:
      // StaggeredGridView.countBuilder(
      //   crossAxisCount: 6,
      //   itemCount: 8,
      //   itemBuilder: (BuildContext context, int index) => FeedsProduct(),
      //   staggeredTileBuilder: (int index) =>
      //   new StaggeredTile.count(3, index.isEven ? 4 : 5),
      //   mainAxisSpacing: 8.0,
      //   crossAxisSpacing: 6.0,
      // )
      GridView.count(
        crossAxisCount: 2,
      childAspectRatio: 240/290,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(100, (index){
        return FeedsProduct();
      }),)
    );
  }
}