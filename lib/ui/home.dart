import 'package:backdrop/backdrop.dart';
import 'package:backdrop/app_bar.dart';
import 'package:backdrop/sub_header.dart';
import 'package:backdrop/button.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/widget/categories.dart';
import 'package:shop/widget/popular_products.dart';
// import 'package:shop/widget/categories.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    List CategoryImages = [

    'images/baby.jpg',
      'images/breakfast_cereals.jpg',
       'images/beverages.jpg',
        'images/cooking_fat.jpg',
        'images/cooking_oil.jpg',
        'images/dairy.jpg',
        'images/f and v.jpg',
        'images/flours.jpg',
        'images/kitchen_essentials.jpg',
        'images/laundry.jpg',
        'images/flours.jpg',
        'images/noodles.jpg',
        'images/personal_effects.jpg',
        'images/rice_cereals.jpg',
        'images/sauces_spices.jpg',
        'images/snacks.jpg',
        'images/spreads.jpg',
        'images/sugar.jpg',
        'images/sweets.png',
        'images/wellness.jpg'
    ];
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          headerHeight: MediaQuery.of(context).size.height*.25,
        appBar: BackdropAppBar(
          leading: BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [ColorsConsts.starterColor, ColorsConsts.endColor])
          ),
        ),
        title: Text("Home"),
    actions: <Widget>[
      IconButton(
          onPressed: (){},
          icon: CircleAvatar(
            radius: 15,
          backgroundColor: Colors.white,
          child: CircleAvatar(
          radius: 13,
          backgroundImage: NetworkImage("https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg"),),),
      iconSize: 15,
      padding: const EdgeInsets.all(10),)
    ],
    ),
    backLayer: Center(
    child: Text("Back Layer"),
    ),
    frontLayer: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: CarouselSlider(
                       items: imgList
                    .map((item) => Container(
                  child: Center(
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ),
                ))
                    .toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height*.3,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Our Categories", style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),),

          ),
          Container(
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx, int index){
                return CategoryWidget(index: index);
              },
              itemCount: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Categories", style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),),
                Spacer(),
                TextButton(onPressed: (){},
                  child: Text("View all >>", style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Colors.red,
                  ),),)

              ],
            ),
          ),
          Container(
          height: 210,
            width: MediaQuery.of(context).size.width*.95,
            child: Swiper(
              itemBuilder: (BuildContext ctx, int index){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blueGrey,
                        child: Image.asset(CategoryImages[index],
                        fit: BoxFit.fill,)),
                  ),
                );
              } ,
              itemCount: CategoryImages.length,
              autoplay: true,
              onTap: (index){},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Popular products", style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),),
                Spacer(),
                TextButton(onPressed: (){},
                  child: Text("View all >>", style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Colors.red,
                  ),),)

              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 285,
            margin: EdgeInsets.symmetric(horizontal: 3),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx, int index) {
                return PopularProducts();
              },
            ),
          )
        ],
      ),
    ),
    ),
      ),
    );
  }
}
