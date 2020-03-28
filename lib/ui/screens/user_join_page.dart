import 'package:flutter/material.dart';
import 'package:medusa/ui/screens/user_home_page.dart';

class UserJoin extends StatefulWidget {
  static const String routeName = "/user_join";

  @override
  State<StatefulWidget> createState() => _UserJoinState();
}

class _UserJoinState extends State<UserJoin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Medusa",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("User information..."),
            RaisedButton(
              splashColor: Theme.of(context).colorScheme.secondary,
              child: Text("CONTINUE"),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(UserHome.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
