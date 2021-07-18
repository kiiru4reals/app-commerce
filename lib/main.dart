import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/const/theme_data.dart';
import 'package:shop/provider/dark_theme_provider.dart';
import 'ui/bottom_bar.dart';


void main() => runApp( MaterialApp(
  home: BottomBarScreen(),
));
class MyApp extends StatelessWidget {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  @override

  Widget build(BuildContext context) {
    return MultiProvider (providers: [
      ChangeNotifierProvider(create: (_){
        return themeChangeProvider;
      })
    ],
    child:
    Consumer<DarkThemeProvider>(
      builder: (context, themeData, child) {
        return MaterialApp(
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
        );
      }
    ));
  }
}