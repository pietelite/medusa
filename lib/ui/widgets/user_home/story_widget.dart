import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medusa/api/data/story.dart';
import 'package:medusa/util/dummy_data.dart';

class StoryWidget extends StatefulWidget {
  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override

  final Story story = story1;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Card(
        child: ListView.builder(itemBuilder: (_context, index) {
          return Padding(
              padding: EdgeInsets.all(10),
              child: Text(story.anecdotes[index]));
        },
        itemCount: story.anecdotes.length,),
        elevation: 15,
      ),
    );
  }
}
