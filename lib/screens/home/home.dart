import 'package:coffee_app/screens/home/coffeelist.dart';
import 'package:coffee_app/screens/home/settings_form.dart';
import 'package:coffee_app/services/auth.dart';
import 'package:coffee_app/services/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authInstance = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showBottom() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider.value(
      value: DB_Service().coffeeStream,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _authInstance.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("logout"),
              textColor: Colors.brown[50],
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              textColor: Colors.brown[50],
              onPressed: () {
                _showBottom();
              },
            ),
          ],
          elevation: 0,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: CoffeeList()),
      ),
    );
  }
}
