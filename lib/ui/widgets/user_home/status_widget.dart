import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatefulWidget {
  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  var isClosed = true;
  var isCulprit = false;

  void onSwiped() {
    setState(() {
      isClosed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isClosed
        ? Card(
            elevation: 15,
            margin: EdgeInsets.all(40),
            child: InkWell(
              onLongPress: () {
                setState(() {
                  isClosed = false;
                });
              },
              child: Center(
                child: Text("Hold to uncover"),
              ),
            ),
            color: Theme.of(context).colorScheme.secondary.withAlpha(200),
          )
        : Card(
            elevation: 5,
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("What do you think you are?"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      splashColor: Colors.white,
                      color: !isCulprit ? Colors.blue : Colors.white,
                      child: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.mood, size: 20),
                            ),
                            Text("INNOCENT"),
                          ],
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            isCulprit = false;
                          },
                        );
                      },
                    ),
                    RaisedButton(
                      splashColor: Colors.white,
                      color: isCulprit ? Colors.red : Colors.white,
                      child: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.mood_bad, size: 20),
                            ),
                            Text("CULPRIT"),
                          ],
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isCulprit = true;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            color: Colors.white,
          );
  }
}
