import 'package:flutter/material.dart';
class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key? key, required this.index}) : super(key: key);
  final int? index;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<Map<String,Object>> categories=[
    {
      'categoryName': 'Baby products',
      'categoryImagePath': 'images/baby.jpg'
    },
    {
      'categoryName': 'Breakfast cereals',
      'categoryImagePath': 'images/breakfast_cereals.jpg',
    },
    {
      'categoryName': 'Beverages',
      'categoryImagePath': 'images/beverages.jpg'
    },
    {
      'categoryName': 'Cooking Fats & Oils',
      'categoryImagePath': 'images/cooking_fat.jpg'
    },
    {
      'categoryName': 'Dairy',
      'categoryImagePath': 'images/dairy.jpg'
    },
    {
      'categoryName': 'Fruits and Vegetables',
      'categoryImagePath': 'images/f and v.jpg'
    },
    {
      'categoryName': 'Flour',
      'categoryImagePath': 'images/flours.jpg'
    },
    {
      'categoryName': 'Kitchenware',
      'categoryImagePath': 'images/kitchen_essentials.jpg'
    },
    {
      'categoryName': 'Laundry',
      'categoryImagePath': 'images/laundry.jpg'
    },
    {
      'categoryName': 'Noodles & spaghetti',
      'categoryImagePath': 'images/noodles.jpg'
    },
    {
      'categoryName': 'Personal effects',
      'categoryImagePath': 'images/personal_effects.jpg'
    },
    {
      'categoryName': 'Rice and Cereals',
      'categoryImagePath': 'images/rice_cereals.jpg'
    },
    {
      'categoryName': 'Sauces & spices',
      'categoryImagePath': 'images/sauces_spices.jpg'
    },
    {
      'categoryName': 'Snacks',
      'categoryImagePath': 'images/snacks.jpg'
    },
    {
      'categoryName': 'Spreads',
      'categoryImagePath': 'images/spreads.jpg'
    },
    {
      'categoryName': 'Sugar',
      'categoryImagePath': 'images/sugar.jpg'
    },
    {
      'categoryName': 'Wellness',
      'categoryImagePath': 'images/wellness.jpg'
    }

  ];

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(categories[widget.index]!['categoryImagePath']),
            fit: BoxFit.cover
          ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 150,


        ),
        Positioned(
            bottom:0,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16,
              vertical: 8),
              color: Theme.of(context).backgroundColor,
              child: Text(categories[widget.index]!["categoryName"], style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Theme.of(context).textSelectionColor
              ),),
            ))
      ],
    );
  }
}
