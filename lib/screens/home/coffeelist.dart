import 'package:coffee_app/screens/home/coffeeTile.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/models/coffee_record.dart';
import 'package:provider/provider.dart';

class CoffeeList extends StatefulWidget {
  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    List<CoffeeRecord> coffee = Provider.of<List<CoffeeRecord>>(context) ?? [];

    return ListView.builder(
      itemCount: coffee.length,
      itemBuilder: (context, index) {
        return CoffeeTile(tile: coffee[index]);
      },
    );
  }
}
