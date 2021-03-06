import 'package:flutter/material.dart';

import 'brands_rail_widget.dart';

class BrandNavigationRailScreen extends StatefulWidget {
  BrandNavigationRailScreen({Key? key}) : super(key: key);

  static const routeName = '/brands_navigation_rail';
  @override
  _BrandNavigationRailScreenState createState() =>
      _BrandNavigationRailScreenState();
}

class _BrandNavigationRailScreenState extends State<BrandNavigationRailScreen> {
  int _selectedIndex = 0;
  final padding = 8.0;
  late String routeArgs;
  late String brand;
  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();
    _selectedIndex = int.parse(
      routeArgs.substring(1, 2),
    );
    print(routeArgs.toString());
    if (_selectedIndex == 0) {
      setState(() {
        brand = 'Brand 1';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brand = 'Brand 2';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brand = 'Brand 3';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brand = 'Brand 4';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brand = 'Brand 5';
      });
    }
    if (_selectedIndex == 5) {
      setState(() {
        brand = 'Brand 6';
      });
    }
    if (_selectedIndex == 6) {
      setState(() {
        brand = 'Brand 7';
      });
    }
    if (_selectedIndex == 7) {
      setState(() {
        brand = 'All';
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      minWidth: 56.0,
                      groupAlignment: 1.0,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                          if (_selectedIndex == 0) {
                            setState(() {
                              brand = 'Brand 1';
                            });
                          }
                          if (_selectedIndex == 1) {
                            setState(() {
                              brand = 'Brand 2';
                            });
                          }
                          if (_selectedIndex == 2) {
                            setState(() {
                              brand = 'Brand 3';
                            });
                          }
                          if (_selectedIndex == 3) {
                            setState(() {
                              brand = 'Brand 4';
                            });
                          }
                          if (_selectedIndex == 4) {
                            setState(() {
                              brand = 'Brand 5';
                            });
                          }
                          if (_selectedIndex == 5) {
                            setState(() {
                              brand = 'Brand 6';
                            });
                          }
                          if (_selectedIndex == 6) {
                            setState(() {
                              brand = 'Brand 7';
                            });
                          }
                          if (_selectedIndex == 7) {
                            setState(() {
                              brand = 'All';
                            });
                          }
                          print(brand);
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      leading: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(
                                  "https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg"),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                      selectedLabelTextStyle: TextStyle(
                        color: Color(0xffffe6bc97),
                        fontSize: 20,
                        letterSpacing: 1,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.5,
                      ),
                      unselectedLabelTextStyle: TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.8,
                      ),
                      destinations: [
                        buildRotatedTextRailDestination('Brand 1', padding),
                        buildRotatedTextRailDestination("Brand 2", padding),
                        buildRotatedTextRailDestination("Brand 3", padding),
                        buildRotatedTextRailDestination("Brand 4", padding),
                        buildRotatedTextRailDestination("Brand 5", padding),
                        buildRotatedTextRailDestination("Brand 6", padding),
                        buildRotatedTextRailDestination("Brand 7", padding),
                        buildRotatedTextRailDestination("All", padding),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // This is the main content.

          ContentSpace(context, brand)
        ],
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  // final int _selectedIndex;

  final String brand;
  ContentSpace(BuildContext context, this.brand);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) =>
                BrandsNavigationRail(),
          ),
        ),
      ),
    );
  }
}
