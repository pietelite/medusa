import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medusa/ui/widgets/user_home/status_widget.dart';
import 'package:medusa/ui/widgets/user_home/story_widget.dart';
import 'package:medusa/ui/widgets/user_home/voting_widget.dart';
import 'package:medusa/util/reference.dart';

class UserHome extends StatefulWidget {
  static const String routeName = "/user_home";
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentTabIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1,
    );
    _tabController.addListener(() {
      currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: Theme.of(context).textTheme.title,
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.assignment),
              text: "Vote",
            ),
            Tab(
              icon: Icon(Icons.dehaze),
              text: "Story",
            ),
            Tab(
              icon: Icon(Icons.indeterminate_check_box),
              text: "Status",
            ),
          ],
//          labelStyle: Theme
//              .of(context)
//              .textTheme
//              .subhead,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          VotingWidget(),
          StoryWidget(),
          StatusWidget(),
        ],
      ),
    );
  }
}
