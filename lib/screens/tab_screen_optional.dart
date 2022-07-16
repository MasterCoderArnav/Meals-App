import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favourite_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabScreenOptional extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabScreenOptional({Key? key, required this.favouriteMeals}) : super(key: key);

  @override
  State<TabScreenOptional> createState() => _TabScreenOptionalState();
}

class _TabScreenOptionalState extends State<TabScreenOptional> {
  int _selectedPageIndex = 0;
  void _selectPage(int i) {
    setState(() {
      _selectedPageIndex = i;
    });
  }

  List<Map<String, Object>> _pages = [];
  @override
  void initState() {
    _pages = [
      {
        'page': const CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(favourites: widget.favouriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
