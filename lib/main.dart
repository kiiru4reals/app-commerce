import 'package:shop/const/theme_data.dart';
import 'package:shop/routes/product_details.dart';
import 'package:shop/provider/dark_theme_provider.dart';
import 'package:shop/provider/products.dart';
import 'package:shop/ui/wishlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/brands_navigation_rail.dart';
import 'routes/categories_feeds.dart';
import 'routes/upload_new_product.dart';
import 'provider/cart_provider.dart';
import 'provider/favs_provider.dart';
import 'auth/login.dart';
import 'auth/sign_up.dart';
import 'package:shop/ui/bottom_bar.dart';
import 'package:shop/ui/cart.dart';
import 'package:shop/ui/feeds.dart';
import 'package:shop/ui/landing_page.dart';
import 'package:shop/ui/main_screen.dart';
import 'package:shop/ui/user_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Error occured'),
                ),
              ),
            );
          }
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) {
                  return themeChangeProvider;
                }),
                ChangeNotifierProvider(
                  create: (_) => Products(),
                ),
                ChangeNotifierProvider(
                  create: (_) => CartProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => FavsProvider(),
                ),
              ],
              child: Consumer<DarkThemeProvider>(
                  builder: (context, themeData, child) {
                    return MaterialApp(
                      title: 'Flutter Demo',
                      theme:
                      Styles.themeData(themeChangeProvider.darkTheme, context),
                      home: UserState(),
                      //initialRoute: '/',
                      routes: {
                        //   '/': (ctx) => LandingPage(),
                        BrandNavigationRailScreen.routeName: (ctx) =>
                            BrandNavigationRailScreen(),
                        ShoppingCart.routeName: (ctx) => ShoppingCart(),
                        Feeds.routeName: (ctx) => Feeds(),
                        WishList.routeName: (ctx) => WishList(),
                        ProductDetails.routeName: (ctx) => ProductDetails(),
                        CategoriesFeedsScreen.routeName: (ctx) =>
                            CategoriesFeedsScreen(),
                        LoginScreen.routeName: (ctx) => LoginScreen(),
                        SignUpScreen.routeName: (ctx) => SignUpScreen(),
                        BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
                        UploadProductForm.routeName: (ctx) => UploadProductForm(),
                      },
                    );
                  }));
        });
  }
}