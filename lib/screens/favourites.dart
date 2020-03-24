import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/disp_meals.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteList;
  Favourites(this.favouriteList);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: favouriteList.isEmpty
          ? Center(child: Text("NO FAVOURITES ADDED"))
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: DisplayMeals(
                    affordability: favouriteList[index].affordability,
                    title: favouriteList[index].title,
                    complexity: favouriteList[index].complexity,
                    duration: favouriteList[index].duration,
                    id: favouriteList[index].id,
                    imageUrl: favouriteList[index].imageUrl,
                  ),
                );
              },
              itemCount: favouriteList.length,
            ),
    );
  }
}
