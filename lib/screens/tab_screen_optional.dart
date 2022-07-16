import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favourite_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabScreenOptional extends StatefulWidget {
  TabScreenOptional({Key? key}) : super(key: key);

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

  final List<Map<String, Object>> _pages = [
    {
      'page': const CategoryScreen(),
      'title': 'Categories',
    },
    {
      'page': const FavouriteScreen(),
      'title': 'Favourites',
    }
  ];

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
