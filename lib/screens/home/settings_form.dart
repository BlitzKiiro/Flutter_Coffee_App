import 'package:coffee_app/models/user.dart';
import 'package:coffee_app/services/db.dart';
import 'package:coffee_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  //form vals
  String _sugar;
  String _name;
  int _strength;

  //form key
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  @override
  Widget build(BuildContext context) {
    User usr = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DB_Service(uid: usr.uid).userDataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Change account settings',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //name inpute
                  TextFormField(
                    initialValue: snapshot.data.name,
                    decoration:
                        settingsInputDecoration.copyWith(hintText: 'Name'),
                    onChanged: (val) {
                      setState(() {
                        _name = val;
                      });
                    },
                    validator: (val) =>
                        val.isEmpty ? "Please Enter a name" : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //dropdown menu
                  DropdownButtonFormField(
                    value: _sugar ?? snapshot.data.sugar,
                    decoration: settingsInputDecoration,
                    items: sugars.map((val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(' $val sugar(s)'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _sugar = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //slider
                  Slider(
                    value: (_strength ?? snapshot.data.strength).toDouble(),
                    label: 'Strength',
                    activeColor:
                        Colors.brown[_strength ?? snapshot.data.strength],
                    inactiveColor:
                        Colors.brown[_strength ?? snapshot.data.strength],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (val) {
                      setState(() {
                        _strength = val.round();
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //update button
                  RaisedButton(
                      color: Colors.brown[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          await DB_Service(uid: usr.uid).updateUserData(
                              _sugar ?? snapshot.data.sugar,
                              _name ?? snapshot.data.name,
                              _strength ?? snapshot.data.strength);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Center(
              child: SpinKitChasingDots(
                color: Colors.brown,
                size: 50,
              ),
            );
          }
        });
  }
}
