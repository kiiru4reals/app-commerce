import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/const/colors.dart';
import 'package:shop/provider/dark_theme_provider.dart';
class CartFull extends StatefulWidget {
  const CartFull({Key? key}) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 135,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: const Radius.circular(16),
            topRight: const Radius.circular(16),
        ),
        color: Colors.blue,
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1614026480209-cd9934144671?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80'),
              fit: BoxFit.fill
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text('BMW M4',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,

                            ),
                        maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.delete,
                            color: Colors.red,
                            size: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Price:"),
                      SizedBox(width: 5,),
                      Text("KES. 123",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Sub-total:"),
                      SizedBox(width: 5,),
                      Text("KES. 123",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: themeChange.darkTheme? Colors.brown.shade900: Theme.of(context).colorScheme.secondary
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Delivery fee", style: TextStyle(
                          color: themeChange.darkTheme? Colors.brown.shade900: Theme.of(context).colorScheme.secondary),
                      ),
                      Spacer(),
                      Material(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(Icons.remove,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width*.12,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [ColorsConsts.gradiendLStart, ColorsConsts.gradiendLEnd ],
                              stops: [0.0,
                                .7]

                            ),
                          ),
                          child: Text('1', textAlign: TextAlign.center,),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              child: Icon(Icons.add,
                                color: Colors.green,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
