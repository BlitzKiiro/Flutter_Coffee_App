import 'package:coffee_app/Screens/home/home.dart';
import 'package:coffee_app/models/user.dart';
import 'package:coffee_app/screens/authenticate/authenticate.dart';
import 'package:coffee_app/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class Wrapper extends StatelessWidget
{
  @override 
  Widget build(BuildContext context)
  {
    User usr = Provider.of<User>(context);

    //return home or authenticate screen 
    if ( usr == null ) {
      return Authenticate();
    } else {
      return Home();
    }
  }

}