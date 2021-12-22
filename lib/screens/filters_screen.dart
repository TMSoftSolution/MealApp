import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(this.saveFilters, this.currentFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(description),
        activeColor: Theme.of(context).colorScheme.secondary,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan
              };
              widget.saveFilters(_selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (_) {
                  setState(() {
                    _glutenFree = !_glutenFree;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include Vegetarian meals.', _vegetarian,
                    (_) {
                  setState(() {
                    _vegetarian = !_vegetarian;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include Vegan meals.', _vegan, (_) {
                  setState(() {
                    _vegan = !_vegan;
                  });
                }),
                _buildSwitchListTile('Lactose-free',
                    'Only include lactose-free meals.', _lactoseFree, (_) {
                  setState(() {
                    _lactoseFree = !_lactoseFree;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
