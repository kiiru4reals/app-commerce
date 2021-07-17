import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
class UserInfo extends StatefulWidget {

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: UserTitle("Me")
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            UserListTile('Email', 'address', 0, context),
            UserListTile('phone', 'number', 1, context),
            UserListTile('Shipping', '', 2, context),
            UserListTile('Joining', 'date', 3, context),

            Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: UserTitle("My settings")
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
    ListTileSwitch(
    value: _value,
    leading: Icon(Icons.dark_mode),
    onChanged: (value) {
    setState(() {
    _value = value;
    });
    },
    visualDensity: VisualDensity.comfortable,
    switchType: SwitchType.cupertino,
    switchActiveColor: Colors.indigo,
    title: Text('Night mode'),
    ),
            UserListTile('Sign out', '', 4, context),
          ],
        )
      );
  }

  List <IconData> _UserTileIcons=[
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget UserListTile(String title, String subtitle, int index, BuildContext context){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(_UserTileIcons[index]),
          onTap: (){},
        ),
      ),
    );
  }

  Widget UserTitle(String title){
    return Text(title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
      ),
    );

  }
}
