import 'package:flutter/material.dart';
import 'package:receipe_app/Screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  Widget buildListTile(
      IconData icon, String title, void Function()? tapHandeler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandeler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Coocking Up",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          buildListTile(Icons.restaurant, "Meals", () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, "Filters", () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
