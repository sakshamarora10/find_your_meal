import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/meals_screen.dart';
import './screens/mealdetailscreen.dart';
import './screens/tabbarscreen.dart';
import './screens/filter.dart';
import './dummydata.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> selectedMeals = DUMMY_MEALS;
  void setFilters(Map<String, bool> filters, BuildContext context) {
    setState(() {
      _filter = filters;
      selectedMeals = DUMMY_MEALS.where((item) {
        if (_filter['gluten'] && !item.isGlutenFree) return false;
        if (_filter['vegan'] && !item.isVegan) return false;
        if (_filter['vegetarian'] && !item.isVegetarian) return false;
        if (_filter['lactose'] && !item.isLactoseFree) return false;
        return true;
      }).toList();
    });
    Navigator.of(context).pushReplacementNamed('/');
  }

  List<Meal> favouriteList = [];
  void toggleFavourites(String id) {
    int favouriteIndex = favouriteList.indexOf(DUMMY_MEALS
        .firstWhere((item) => item.id == id)); //returns -1 if not found
    setState(() {
      if (favouriteIndex >= 0)
        favouriteList.removeAt(favouriteIndex);
      else
        favouriteList.add(DUMMY_MEALS.firstWhere((item) => item.id == id));
    });
  }
  bool checkFavourite(String id){
    return favouriteList.any((item)=>item.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => ShowTabBar(favouriteList),
        Meals.routename: (context) => Meals(selectedMeals),
        MealDetails.routename: (context) => MealDetails(toggleFavourites,checkFavourite),
        Filters.routename: (context) => Filters(_filter, setFilters),
      },
      title: "meal app",
      theme: ThemeData(
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ))),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Categories());
      },
    );
  }
}
