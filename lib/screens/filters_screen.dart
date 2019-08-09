import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';
  Function setFilters;
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  FiltersScreen(this.setFilters,this._glutenFree,this._vegetarian,this._vegan,this._lactoseFree);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    super.initState();
    _glutenFree=widget._glutenFree;
    _vegetarian = widget._vegetarian;
    _vegan = widget._vegan;
    _lactoseFree = widget._lactoseFree;
  }

  Widget _buildSwitchTile(
      String title, String subtitle, Function onChanged, value) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(subtitle),
        onChanged: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        widget.setFilters(_glutenFree,_vegetarian,_vegan,_lactoseFree);
        Navigator.of(context).pushReplacementNamed('/');},
      child: Scaffold(
        appBar: AppBar(
          title: Text('The Filters are here'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal preferences',
                  style: Theme.of(context).textTheme.title),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchTile(
                      'Gluten Free', 'Only include gluten-free meals',
                      (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }, _glutenFree),
                  _buildSwitchTile(
                      'Vegetarian', 'Only include vegetarian meals',
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }, _vegetarian),
                  _buildSwitchTile('Vegan', 'Only include vegan meals',
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }, _vegan),
                  _buildSwitchTile(
                      'Lactose Free', 'Only include lactose-free meals',
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }, _lactoseFree),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
