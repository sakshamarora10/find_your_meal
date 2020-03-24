import '../screens/filter.dart';
import 'package:flutter/material.dart';

class ShowDrawer extends StatelessWidget {
  Widget listTileBuilder(IconData icon,String text,Function onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.blue,
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: Icon(icon),
        title: Text(text,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50),
            alignment: Alignment.center,
            child: Text(
              "Cooking up...",
              style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 30,
              ),
            ),
          ),
          listTileBuilder(
            Icons.category, 
            'Categories',
            (){
              Navigator.of(context).pushReplacementNamed('/');
            }),
          listTileBuilder(
            Icons.format_align_center, 
            'Filter',
            (){
              Navigator.of(context).pushReplacementNamed(Filters.routename);
            }),
        ],
      ),
    );
  }
}
