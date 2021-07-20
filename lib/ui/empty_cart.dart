import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*.4,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.fill,
                image: AssetImage('assets/images/emptycart.png')
            )
          ),
        )
      ],
    );
  }
}
