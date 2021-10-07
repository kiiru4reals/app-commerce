import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/provider/dark_theme_provider.dart';
import 'package:shop/ui/feeds.dart';

class EmptyWishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height*.4,
          decoration: BoxDecoration(image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/emptywishlist.png')
          ),
          ),
        ),
        Text('Your wishlist is empty',
          style: TextStyle(color: Theme.of(context).textSelectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 50,),
        Text('Explore more to add to wishlist',
          style: TextStyle(color: themeChange.darkTheme ? Theme.of(context).disabledColor: ColorsConsts.subTitle,
              fontSize: 26,
              fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 50,
        ),
        Container(

          width: MediaQuery.of(context).size.width*.9,
          height: MediaQuery.of(context).size.height*.06,
          child: ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(Feeds.routeName),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.cyanAccent.shade400)
                ),
                primary: Colors.redAccent,
              ),
              child: Text('Add to wishlist'.toUpperCase(),
                style: TextStyle(color: themeChange.darkTheme ? Theme.of(context).disabledColor: ColorsConsts.subTitle,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              )
          ),
        ),
      ],
    );
  }
}