import 'package:find_your_meal/dummydata.dart';
import 'package:flutter/material.dart';
import '../models/meals.dart';
import './favourites.dart';

class MealDetails extends StatefulWidget {
  Function toggleFavourite;
  Function checkFavourite;
  MealDetails(this.toggleFavourite, this.checkFavourite);
  static const routename = '/meal_details';

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  Widget containerBuilder(context, title) {
    return Container(
      //color: Colors.black26,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.grey[200], Colors.white]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;
    Meal selectedMeal = DUMMY_MEALS.firstWhere((item) => item.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: <Widget>[
          IconButton(
              color: widget.checkFavourite(id) ? Colors.red : Colors.white,
              icon: Icon(Icons.favorite),
              onPressed: () {
                widget.toggleFavourite(id);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                containerBuilder(context, "Ingredients"),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,
                    ),
                  ),
                  height: 150,
                  child: ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.pink[300],
                        child: Center(
                          child: Text(
                            selectedMeal.ingredients[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                containerBuilder(context, 'Recipie'),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[400],
                    ),
                    color: Colors.grey[200],
                  ),
                  height: 300,
                  child: ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          selectedMeal.steps[index],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue[500],
                          child: Text('${index + 1}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
