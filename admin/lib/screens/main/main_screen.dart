import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  DrawerHeader(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  DrawerListTile(
                    title: "Dashboard",
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    press: () {

                    },
                  ),
                  DrawerListTile(
                    title: "Transaction",
                    svgSrc: "assets/icons/menu_tran.svg",
                    press: () {

                    },
                  ),
                  DrawerListTile(
                    title: "Task",
                    svgSrc: "assets/icons/menu_task.svg",
                    press: () {

                    },
                  ),
                  DrawerListTile(
                    title: "Documents",
                    svgSrc: "assets/icons/menu_doc.svg",
                    press: () {

                    },
                  ),
                  DrawerListTile(
                    title: "Store",
                    svgSrc: "assets/icons/menu_store.svg",
                    press: () {

                    },
                  ),
                  DrawerListTile(
                    title: "Notification",
                    svgSrc: "assets/icons/menu_notification.svg",
                    press: () {

                    },
                  ),
                  DrawerListTile(
                    title: "Profile",
                    svgSrc: "assets/icons/menu_profile.svg",
                    press: () {

                    },
                  ),
                  DrawerListTile(
                    title: "Settings",
                    svgSrc: "assets/icons/menu_setting.svg",
                    press: () {

                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final String svgSrc;
  final Function press;

  const DrawerListTile({
    Key key,
    @required this.title,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
