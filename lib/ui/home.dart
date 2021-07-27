import 'package:backdrop/backdrop.dart';
import 'package:backdrop/app_bar.dart';
import 'package:backdrop/sub_header.dart';
import 'package:backdrop/button.dart';
import 'package:flutter/material.dart';
import 'package:shop/const/colors.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
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
    frontLayer: Center(
    child: Text("Front Layer"),
    ),
      ),
    ),);
  }
}
