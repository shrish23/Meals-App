import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.saveFilters, this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool?) updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile("Gluten-Free",
                    "Only include Gluten free Meals", _glutenFree, (val) {
                  setState(() {
                    _glutenFree = val!;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only include Vegetarian Meals", _vegetarian,
                    (val) {
                  setState(() {
                    _vegetarian = val!;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "Only include Vegan Meals", _vegan, (val) {
                  setState(() {
                    _vegan = val!;
                  });
                }),
                _buildSwitchListTile("Lactose-Free",
                    "Only include Lactose free Meals", _lactoseFree, (val) {
                  setState(() {
                    _lactoseFree = val!;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
