import 'package:flutter/material.dart';
import 'package:coffee_app/models/coffee_record.dart';

class CoffeeTile extends StatelessWidget {
  final CoffeeRecord tile;
  CoffeeTile({this.tile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown[tile.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
            radius: 25,
          ),
          title: Text(tile.name),
          subtitle: Text('Takes ${tile.sugar} sugar(s)'),
        ),
      ),
    );
  }
}
