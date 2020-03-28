import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medusa/api/data/user.dart';
import 'package:medusa/util/dummy_data.dart';

class VotingWidget extends StatefulWidget {
  @override
  State<VotingWidget> createState() => _VotingWidgetState();
}

class _VotingWidgetState extends State<VotingWidget> {
  List<User> users = userList;
  var anyUserChosen = false;
  User chosen;

  void _chooseCard(VotingCard votingCard) {
    anyUserChosen = true;
    setState(() {
      chosen = votingCard.user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text("Who do you want eliminated?"),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (_context, index) {
              return VotingCard(
                userList[index],
                _chooseCard,
                anyUserChosen && chosen == userList[index],
              );
            },
            shrinkWrap: true,
            itemCount: userList.length,
          ),
        ),
      ],
    );
  }
}

class VotingCard extends StatelessWidget {
  final Function _chooseCard;
  User user;
  var isChosen;

  VotingCard(this.user, this._chooseCard, this.isChosen);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: isChosen
          ? Theme.of(context).colorScheme.secondary
          : Colors.white,
      child: InkWell(
        onTap: () {
          _chooseCard(this);
        },
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(5),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                child: Text(
                  user.name.substring(0, 1),
                  style: Theme.of(context).textTheme.body1,
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  user.name,
                  style: Theme.of(context).textTheme.body1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    );
  }
}
