import 'package:flutter/material.dart';
import 'package:meals/utils/routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      String title, IconData iconData, VoidCallback? tapHandler) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
          color: Colors.white,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          buildListTile(
            "Meals",
            Icons.restaurant_rounded,
            () {
              Navigator.of(context).pushReplacementNamed(tabRoute);
            },
          ),
          buildListTile(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(filterRoute);
            },
          ),
        ],
      ),
    );
  }
}
