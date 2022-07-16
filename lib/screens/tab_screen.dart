import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favourite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Category',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favourite',
            ),
          ]),
        ),
        body: const TabBarView(
          children: <Widget>[
            CategoryScreen(),
            FavouriteScreen(),
          ],
        ),
      ),
    );
  }
}
