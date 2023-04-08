import 'package:flutter/material.dart';
import 'package:receipe_app/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filtersScreen';
  final Function saveFilter;
  final Map<String, bool> cuurentFilters;
  const FiltersScreen({super.key, required this.saveFilter, required this.cuurentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchTile(String title, String subtitle, bool value,
      void Function(bool) updateValue) {
    return SwitchListTile(
      value: value,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  late bool _glutenFree = widget.cuurentFilters['gluten'] as bool;
  late bool _vegetarian = widget.cuurentFilters['vegetarian'] as bool;
  late bool _vegan = widget.cuurentFilters['vegan'] as bool;
  late bool _lactoseFree = widget.cuurentFilters['lactose'] as bool;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filters"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTile(
                  "Gluten-Free", "Show only gluten-free meals", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchTile(
                  "Vegetarian", "Show only Vegetarian meals", _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchTile("Vegan", "Show only vegan meals", _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              _buildSwitchTile(
                  "Lactose-Free",
                  "Show only glutenlactose-free meals",
                  _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
