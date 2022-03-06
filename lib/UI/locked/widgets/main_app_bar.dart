import 'package:cboard_mobile/providers/locked/home.dart';
import 'package:cboard_mobile/UI/locked/widgets/edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget {
  final double scrollOffset;

  const MainAppBar({
    Key key,
    this.scrollOffset = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List of boards
    final List<ListTile> boards = <ListTile>[
      ListTile(
          leading: Icon(
            Icons.assignment,
            color: Theme.of(context).primaryColor,
            size: 30.0,
          ),
          title: Text('Board One'),
          onTap: () => print('Board Clicked')),
      ListTile(
          leading: Icon(
            Icons.assignment,
            color: Theme.of(context).primaryColor,
            size: 30.0,
          ),
          title: Text('Board Two'),
          onTap: () => print('Board Clicked')),
      ListTile(
          leading: Icon(
            Icons.backup,
            color: Theme.of(context).primaryColor,
            size: 30.0,
          ),
          title: Text('Board Three'),
          onTap: () => print('Board Clicked')),
    ];

    //Create bottom sheet
    void _showBottomSheet() => showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 170,
              child: Column(
                children: boards,
              ),
            );
          },
        );

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double textSize = constraints.maxHeight * 0.4;
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Readability Settings

            // Default main bar at Locked Screen
            Padding(
              padding: EdgeInsets.only(left: 165),
              child: Text(
                'Home',
                overflow: TextOverflow.ellipsis,
                style: TextStyle( color: Colors.white, fontSize: textSize),
              ),
            ),
            // Lock

            GestureDetector( // Button to unlock Screen
              onTap: () => Provider.of<HomeModel>(context, listen: false)
                  .tapUnlock(context), // insert new homescreen here
              child: Icon(
                Icons.lock,
                color: Colors.white,
                size: 25.0,
              ),
            ),
          ],
        ),
      );
    });
  }
}
