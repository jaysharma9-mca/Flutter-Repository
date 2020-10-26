import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navigation_drawer_item_view.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) {
          return DrawerMobileView();
        }
        return SizedBox();
      },
    );
  }
}

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Jay Sharma'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.blueGrey,
                ],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
          for (var item in kNavigationItems)
            ListTile(
              title: Text(item.text),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
