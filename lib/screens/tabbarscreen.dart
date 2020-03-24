import 'package:find_your_meal/models/meals.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourites.dart';
import '../widgets/showdrawer.dart';

class ShowTabBar extends StatefulWidget {
  final List<Meal> favouriteList;
  ShowTabBar(this.favouriteList);
  @override
  _ShowTabBarState createState() => _ShowTabBarState();
}

class _ShowTabBarState extends State<ShowTabBar> {
  List<Widget> showTab;
  List<String> showAppbarText = ['Categories', 'Favourites'];
  int selectedIndex = 0;
  @override
  void initState() {
    showTab = [
      Categories(),
      Favourites(widget.favouriteList),
    ];

    super.initState();
  }

  void selectedItem(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${showAppbarText[selectedIndex].toUpperCase()} '),
        centerTitle: true,
      ),
      drawer: ShowDrawer(),
      body: showTab[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourites"),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        onTap: selectedItem,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
