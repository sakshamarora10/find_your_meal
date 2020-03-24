import '../widgets/showdrawer.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  final Map<String, bool> filters;
  final Function setFilter;
  Filters(this.filters, this.setFilter);
  static const routename = '/filters';

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  Widget switchTileBuilder(String text, bool value, Function onChanged) {
    return SwitchListTile(
      onChanged: onChanged,
      value: value,
      title: Text(text),
    );
  }

  bool gluten;
  bool lactose;
  bool vegetarian;
  bool vegan;
  @override
  void initState() {
     gluten =widget.filters['gluten'];
     lactose =widget.filters['lactose'];
     vegetarian =widget.filters['vegetarian'];
     vegan = widget.filters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: ShowDrawer(),
        body: Column(
          children: <Widget>[
            switchTileBuilder('Gluten free', gluten, (val) {
              setState(() {
                gluten = val;
              });
            }),
            switchTileBuilder('Vegan', vegan, (val) {
              setState(() {
                vegan = val;
              });
            }),
            switchTileBuilder('Vegetarian', vegetarian, (val) {
              setState(() {
                vegetarian = val;
              });
            }),
            switchTileBuilder('Lactose free', lactose, (val) {
              setState(() {
                lactose = val;
              });
            }),
            RaisedButton(
              onPressed: () {
                widget.setFilter({
                  'gluten': gluten,
                  'lactose': lactose,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                },context);
              },
              child: Text("Submit"),
            )
          ],
        ));
  }
}
