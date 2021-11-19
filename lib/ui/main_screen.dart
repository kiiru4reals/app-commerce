import 'package:shop/routes/upload_new_product.dart';
import 'package:flutter/material.dart';
import 'bottom_bar.dart';

class MainScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarScreen(), UploadProductForm()],
    );
  }
}