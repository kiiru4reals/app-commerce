import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Baby products',
      'categoryImagesPath': 'images/baby.jpg',
    },
    {
      'categoryName': 'Beverages',
      'categoryImagesPath': 'images/beverages.jpg',
    },
    {
      'categoryName': 'Breakfast cereals',
      'categoryImagesPath': 'images/breakfast_cereals.jpg',
    },
    {
      'categoryName': 'Cooking Fat',
      'categoryImagesPath': 'images/cooking_fat.jpg',
    },
    {
      'categoryName': 'Cooking oils',
      'categoryImagesPath': 'images/cooking_oil.jpg',
    },
    {
      'categoryName': 'Dairy products',
      'categoryImagesPath': 'images/dairy.jpg',
    },
    {
      'categoryName': 'Fruits and Vegetables',
      'categoryImagesPath': 'images/f and v.jpg',
    },
    {
      'categoryName': 'Flours',
      'categoryImagesPath': 'images/flours.jpg',
    },
    {
      'categoryName': 'Kitchen Essentials',
      'categoryImagesPath': 'images/kitchen_essentials.jpg',
    },
    {
      'categoryName': 'Laundry',
      'categoryImagesPath': 'images/laundry.jpg',
    },
    {
      'categoryName': 'Noodles',
      'categoryImagesPath': 'images/noodles.jpg',
    },
    {
      'categoryName': 'Personal effects',
      'categoryImagesPath': 'images/personal_effects.jpg',
    },
    {
      'categoryName': 'Rice and cereals',
      'categoryImagesPath': 'images/rice_cereals.jpg',
    },
    {
      'categoryName': 'Sauces and spices',
      'categoryImagesPath': 'images/sauces_spices.jpg',
    },
    {
      'categoryName': 'Snacks',
      'categoryImagesPath': 'images/snacks.jpg',
    },
    {
      'categoryName': 'Spreads',
      'categoryImagesPath': 'images/spreads.jpg',
    },
    {
      'categoryName': 'Sugar',
      'categoryImagesPath': 'images/sugar.jpg',
    },
    {
      'categoryName': 'Wellness',
      'categoryImagesPath': 'images/wellness.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(categories[widget.index]['categoryImagesPath']?.toString()?? ''),
            fit: BoxFit.cover),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 150,
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Theme.of(context).backgroundColor,
            child: Text(
              categories[widget.index]['categoryName']?.toString()?? '',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Theme.of(context).textSelectionColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
