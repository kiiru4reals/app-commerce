import 'package:shop/auth/login.dart';
import 'package:shop/auth/sign_up.dart';
import 'package:shop/const/theme_data.dart';
import 'package:shop/provider/cart_provider.dart';
import 'package:shop/provider/favs_provider.dart';
import 'package:shop/routes/product_details.dart';
import 'package:shop/provider/dark_theme_provider.dart';
import 'package:shop/provider/products.dart';
import 'package:shop/routes/upload_new_product.dart';
import 'package:shop/ui/bottom_bar.dart';
import 'package:shop/ui/landing_page.dart';
import 'package:shop/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/routes/brands_navigation_rail.dart';
import 'package:shop/routes/categories_feeds.dart';
import 'package:shop/ui/cart.dart';
import 'package:shop/ui/feeds.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
          ChangeNotifierProvider(create: (_) =>
            Products(),
          ),
          ChangeNotifierProvider(
            create: (_) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavsProvider(),
          ),
        ],
        child:
        Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: LandingPage(),
            //initialRoute: '/',
            routes: {
              //   '/': (ctx) => LandingPage(),
              BrandNavigationRailScreen.routeName: (ctx) =>
                  BrandNavigationRailScreen(),
              ShoppingCart.routeName: (ctx) => ShoppingCart(),
              Feeds.routeName: (ctx) => Feeds(),
              WishList.routeName: (ctx) => WishList(),
              ProductDetails.routeName: (ctx) => ProductDetails(),
              CategoriesFeedsScreen.routeName: (ctx) => CategoriesFeedsScreen(),
              LoginScreen.routeName: (ctx) => LoginScreen(),
              SignUpScreen.routeName: (ctx) => SignUpScreen(),
              BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
              UploadProductForm.routeName: (ctx) => UploadProductForm()
            },
          );
        }));
  }
}
